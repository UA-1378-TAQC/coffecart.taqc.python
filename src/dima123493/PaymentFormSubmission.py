from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class PaymentFormSubmission:
    def __init__(self):
        self.sel = BuiltIn().get_library_instance('SeleniumLibrary')

    def click_on_coffee_cup(self, index):
        xpath = f"//div[@class='cup'][{index}]"
        self.sel.click_element(xpath)

    def click_on_total_modal(self):
        self.sel.click_element("//div[@class='pay-container']")

    def confirm_payment_form_is_visible(self, timeout=5):
        wait = WebDriverWait(self.sel.driver, timeout)
        wait.until(EC.visibility_of_element_located((By.ID, "name")))
        wait.until(EC.visibility_of_element_located((By.ID, "email")))
        wait.until(EC.visibility_of_element_located((By.ID, "promotion")))

    def enter_name(self, name):
        self.sel.input_text("name", name)

    def enter_email(self, email):
        self.sel.input_text("email", email)

    def mark_checkbox(self): #not mark but verify uncheck
        self.sel.click_element("promotion")

    def click_submit_button(self):
        self.sel.click_element("//button[text()='Submit']")

    def verify_confirmation_message_appears(self, timeout=5):
        try:
            element = WebDriverWait(self.sel.driver, timeout).until(
                EC.visibility_of_element_located((By.XPATH, "//*[@id=\"app\"]/div[1]")))
            message = element.text
            return message
        except Exception as e:
            return None

    def verify_cart_is_empty_or_total_resets(self):
        empty_cart_message = self.sel.get_text("//*[@id=\"app\"]/div[2]/div[1]/button")
        return empty_cart_message
