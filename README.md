# ☕ Coffee Cart Test Automation

This project is built for automated testing of the [Coffee Cart](https://coffee-cart.app/) website using **Robot Framework** — a powerful and readable testing framework ideal for both manual testers and automation engineers.

## 🔍 About Coffee Cart

Coffee Cart is a demo e-commerce web application that simulates an online coffee store. It includes the following features:  
- Viewing a list of coffee products  
- Adding items to the cart  
- Checkout functionality  
- Form handling and validation  
- Local storage (cart state is preserved)

It is a perfect training ground for UI test automation and validation of e-commerce workflows.

## 🎯 Project Goal

The objective is to implement a maintainable and readable test suite that ensures:
- Correct handling of cart and checkout flows
- Proper form validation
- Accurate user interface behavior

## 🧰 Technologies and Tools

- 🤖 **Robot Framework** — readable test automation framework
- 🐍 **Python 3.11+**
- 🧪 **SeleniumLibrary** — for browser automation
- 📄 **Custom Python Keywords** — for reusable actions (e.g., `CartPage.py`)
- 🗺️ **Page Object Model (POM)** — used in Python modules for clarity and reuse
- 📦 **requirements.txt** — for dependencies

## 📦 Installation
Set up a virtual environment and activate it:
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

Install dependencies:
pip install -r requirements.txt

Install Robot Framework and SeleniumLibrary:
pip install robotframework seleniumlibrary

