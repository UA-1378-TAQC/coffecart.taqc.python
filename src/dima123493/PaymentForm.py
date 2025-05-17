from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class PaymentForm:
    COFFEE_CUP = "//div[@class='cup'][{index}]"
    TOTAL_MODAL = "//div[@class='pay-container']"
    NAME_FIELD = "name"
    EMAIL_FIELD = "email"
    PROMO_CHECKBOX = "promotion"
    SUBMIT_BUTTON = "//button[text()='Submit']"
    CONFIRMATION_MESSAGE = "//*[@id='app']/div[1]"
    EMPTY_CART_MESSAGE = "//*[@id='app']/div[2]/div[1]/button"

    def __init__(self):
        self.sel = BuiltIn().get_library_instance('SeleniumLibrary')

    def click_on_coffee_cup(self, index):
        self.sel.click_element(self.COFFEE_CUP.format(index=index))

    def click_on_total_modal(self):
        self.sel.click_element(self.TOTAL_MODAL)

    def confirm_payment_form_is_visible(self, timeout=5):
        wait = WebDriverWait(self.sel.driver, timeout)
        wait.until(EC.visibility_of_element_located((By.ID, self.NAME_FIELD)))
        wait.until(EC.visibility_of_element_located((By.ID, self.EMAIL_FIELD)))
        wait.until(EC.visibility_of_element_located((By.ID, self.PROMO_CHECKBOX)))

    def enter_name(self, name):
        self.sel.input_text(self.NAME_FIELD, name)

    def enter_email(self, email):
        self.sel.input_text(self.EMAIL_FIELD, email)

    def mark_checkbox(self):  # Перевірити, що чекбокс не відмічений, потім клік
        self.sel.click_element(self.PROMO_CHECKBOX)

    def click_submit_button(self):
        self.sel.click_element(self.SUBMIT_BUTTON)

    def verify_confirmation_message_appears(self, timeout=5):
            element = WebDriverWait(self.sel.driver, timeout).until(
                EC.visibility_of_element_located((By.XPATH, self.CONFIRMATION_MESSAGE))
            )
            return element.text

    def verify_cart_is_empty_or_total_resets(self):
        return self.sel.get_text(self.EMPTY_CART_MESSAGE)
