from robot.libraries.BuiltIn import BuiltIn

def go_to_cart_page():
    sel = BuiltIn().get_library_instance('SeleniumLibrary')
    sel.click_element("//a[@href=\"/cart\"]")

def get_empty_cart_message():
    sel = BuiltIn().get_library_instance('SeleniumLibrary')
    return sel.get_text("//div[@class='list']/p")

