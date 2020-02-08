package net.serenity.cucumber.pages;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.pages.PageObject;
import static org.junit.Assert.*;

@DefaultUrl("http://10.102.22.78:8080/Cyclos/do/login")
public class CyclosHomePage extends PageObject{
    @FindBy(id="cyclosUsername")
    private WebElementFacade userName;
    
    @FindBy(id="cyclosPassword")
    private WebElementFacade password;
    
    @FindBy(css="input.button")
    private WebElementFacade submitButton;
    
    @FindBy(xpath=".//*[@id='menu1']/span[2]")
    private WebElementFacade menuPersonal;
    
    @FindBy(xpath=".//*[@id='submenu1.3']/span[2]")
    private WebElementFacade menuPersonalContacts;
    
    @FindBy(xpath=".//*[@id='tdContents']/table/tbody/tr[2]/td/div/table/tbody/tr[5]/td[1]/a")
    private WebElementFacade contactPJagtap;
    
    @FindBy(xpath=".//*[@id='tdContents']/table[2]/tbody/tr[2]/td/table/tbody/tr[1]/td[2]/input")
    private WebElementFacade makePaymentSubmit;
    
    @FindBy(id="amount")
    private WebElementFacade amountTextBox;
    
    @FindBy(id="description")
    private WebElementFacade amountDescription;
    
    @FindBy(id="submitButton")
    private WebElementFacade amountSubmitButton;
    
    @FindBy(xpath=".//*[@id='tdContents']/form/table[1]/tbody/tr[2]/td/table/tbody/tr[6]/td/input")
    private WebElementFacade paymentConfirmation;
    
    @FindBy(xpath=".//*[@id='tdContents']/table/tbody/tr[2]/td/table/tbody/tr[1]/td")
    private WebElementFacade paymentConfirmationMsg;
    
    @FindBy(xpath=".//*[@id='menu6']/span[2]")
    private WebElementFacade logoutUser;
    
    @FindBy(xpath=".//*[@id='tdContents']/table[2]/tbody/tr[2]/td/table/tbody/tr/td[7]/a/img")
    private WebElementFacade messages;
    
    @FindBy(xpath=".//*[@id='tdContents']/form[2]/table[1]/tbody/tr[2]/td/table/tbody/tr[2]/td[3]/table/tbody/tr/td[2]/a")
    private WebElementFacade firstMessage;
    
    @FindBy(xpath=".//*[@id='tdContents']/table[1]/tbody/tr[2]/td/table/tbody/tr[5]/td[2]/div")
    private WebElementFacade confirmMessageDetails;
    
    @FindBy(xpath=".//*[@id='tdContents']/table[2]/tbody/tr[2]/td/table/tbody/tr[2]/td[4]/input")
    private WebElementFacade sendInvoiceSubmit;
    
    @FindBy(xpath=".//*[@id='tdContents']/form/table[1]/tbody/tr[2]/td/table/tbody/tr[12]/td/input")
    private WebElementFacade sendInvoiceSubmitButton;
    
    
	public void enterCyclosCredentials(String arg1, String arg2) {
		// TODO Auto-generated method stub
		userName.type(arg1);
		password.type(arg2);
		submitButton.click();
	}

	public void selectPersonalContacts() {
		// TODO Auto-generated method stub
		menuPersonal.click();
		menuPersonalContacts.click();
		contactPJagtap.click();
		makePaymentSubmit.click();
	}

	public void makePersonalContactPayment() {
		// TODO Auto-generated method stub
		amountTextBox.sendKeys("1");
		amountDescription.sendKeys("Testing amount Dr");
		amountSubmitButton.click();
		paymentConfirmation.click();
		assertEquals(paymentConfirmationMsg.containsText("The payment has been performed"), true);
	}

	public void logoutCurrentUser() {
		// TODO Auto-generated method stub
		logoutUser.click();
		assertEquals("Please confirm to logout", closeAlertAndGetItsText());
	}

	public void checkMessages() {
		// TODO Auto-generated method stub
		messages.click();
		firstMessage.click();
//		assertEquals(confirmMessageDetails.containsText("A payment of 0,01 units was received from Shashi Ranjan (shashiranjan)."), true);
		logoutCurrentUser();
	}
	
	public void sendInvoiceAlert(){
		assertEquals("Send an invoice to Parag Jagtap of 0,01 units?", closeAlertAndGetItsText());
	}

	
	

	private boolean acceptNextAlert = true;
	
	 private String closeAlertAndGetItsText() {
	    try {
	      Alert alert = getDriver().switchTo().alert();
	      String alertText = alert.getText();
	      if (acceptNextAlert) {
	        alert.accept();
	      } else {
	        alert.dismiss();
	      }
	      return alertText;
	    } finally {
	      acceptNextAlert = true;
	    }
	}
/*
    @FindBy(linkText="Logout")
    private WebElementFacade Logout;
    
    @FindBy(id="downloadBtn")
    private WebElementFacade downloadBtn;

	@FindBy(xpath="//a[contains(text(),'Functional UI\n										Execution')]")
    private WebElementFacade funUiExecution;
*/    
}
