from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def go_to_cart_page():
    sel = BuiltIn().get_library_instance('SeleniumLibrary')
    sel.click_element("//a[@href=\"/cart\"]")

def get_empty_cart_message():
    sel = BuiltIn().get_library_instance('SeleniumLibrary')
    return sel.get_text("//div[@class='list']/p")

def go_to_menu_page():
    sel = BuiltIn().get_library_instance('SeleniumLibrary')
    sel.click_element("//a[@href=\"/\"]")

def click_drink(drink_name):
    drink = {"Espresso":1,"Espresso Macchiato":2,"Cappuccino":3,"Mocha":4,"Flat White":5,"Americano":6,"Cafe Latte":7,"Espresso Con Panna":8,"Cafe Breve":9}
    sel = BuiltIn().get_library_instance('SeleniumLibrary')
    sel.click_element("//*[@id=\"app\"]/div[2]/ul/li[" + str(drink[drink_name]) + "]")
    
def click_minus_button():
    sel = BuiltIn().get_library_instance('SeleniumLibrary')
    sel.click_element("//*[@id=\"app\"]/div[2]/div/ul/li[2]/div[2]/div/button[2]")

def click_plus_button():
    sel = BuiltIn().get_library_instance('SeleniumLibrary')
    sel.click_element("//*[@id=\"app\"]/div[2]/div/ul/li[2]/div[2]/div/button[1]")

def equal_value_of_the_item(expected_data):
    sel_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    actual_data = sel_lib.get_text("//*[@id=\"app\"]/div[2]/div/ul/li[2]/div[2]/span").strip()

    BuiltIn().should_be_equal(actual_data,expected_data,f"Expected '{expected_data}', but got '{actual_data}'")

def equal_total_price(expected_price):
    sel_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    actual_price = sel_lib.get_text("//*[@id=\"app\"]/div[2]/div/div[1]/button").strip()

    if expected_price not in actual_price:
        raise AssertionError(
            f"Expected '{expected_price}', but got '{actual_price}'"
        )
    else: return True

def equal_total(expected_data):
    sel_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    actual_data = sel_lib.get_text("//*[@id=\"app\"]/div[2]/div/div[1]/button").strip()

    BuiltIn().should_be_equal(actual_data,expected_data,f"Expected '{expected_data}', but got '{actual_data}'")

def equal_cart(expected_data):
    sel_lib = BuiltIn().get_library_instance('SeleniumLibrary')
    actual_data = sel_lib.get_text("//*[@id=\"app\"]/ul/li[2]/a").strip()

    BuiltIn().should_be_equal(actual_data,expected_data,f"Expected '{expected_data}', but got '{actual_data}'")
