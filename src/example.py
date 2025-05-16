from selenium.webdriver.common.by import By
#from selenium.webdriver.remote.webdriver import WebDriver
#from components.full_item_component import FullItemComponent
from components.total_button_element import TotalButtonElement
from pages.menu_page import MenuPage
from pages.github_page import GitHubPage

class CartPage:
    def init(self, driver: WebDriver):
        self.driver = driver
        self.root_full_items = driver.find_elements(By.XPATH, "//li[@class='list-header']/following::li[@class='list-item']")
        self.root_total_button = driver.find_element(By.XPATH, "//div[@class='pay-container']/button[@class='pay']")
        self.empty_cart_message = driver.find_element(By.XPATH, "//div[@class='list']/p")

        self.total_button = TotalButtonElement(driver, self.root_total_button)
        self.full_items = [FullItemComponent(driver, item) for item in self.root_full_items]

    def click_on_total_button(self):
        return self.total_button.click_total_button()

    def clean_cart(self):
        for item in self.full_items.copy():
            item.click_on_delete_button()
        return self

    def delete_item_from_cart(self, item_name: str):
        item = self.get_full_item_by_name(item_name)
        if item:
            item.click_on_delete_button()
        return self

    def increase_number_of_items(self, item_name: str, times: int = 1):
        item = self.get_full_item_by_name(item_name)
        if item:
            item.click_on_add_button(times)
        return self
    def remove_number_of_items(self, item_name: str, times: int = 1):
        item = self.get_full_item_by_name(item_name)
        if item:
            item.click_on_remove_button(times)
        return self

    def get_full_item_by_name(self, item_name: str):
        for item in self.full_items:
            if item.get_item_label_string() == item_name:
                return item
        return None

    def get_total_number_of_items_from_cart(self):
        return sum(item.get_count() for item in self.full_items)

    def get_sum_of_total_prices_from_cart(self):
        return sum(item.get_total_price_as_number() for item in self.full_items)

    def go_to_menu_page(self):
        return MenuPage(self.driver)

    def go_to_github_page(self):
        return GitHubPage(self.driver)

    def empty_cart_message_is_displayed(self):
        try:
            return self.empty_cart_message.is_displayed()
        except Exception:
            return False