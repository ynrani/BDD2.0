package net.serenity.cucumber.steps;

import org.openqa.selenium.WebDriver;


/*import static org.junit.Assert.assertEquals;
import net.thucydides.core.annotations.BlurScreenshots;
import net.thucydides.core.annotations.Issue;
*/
import net.thucydides.core.annotations.Managed;
//import net.thucydides.core.annotations.ManagedPages;
import net.thucydides.core.annotations.Steps;
//import net.thucydides.core.pages.Pages;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenity.cucumber.steps.serenity.MyFeatureEndUserSteps;
import net.serenitybdd.core.Serenity;

public class CyclosLoginSteps {
		@Managed(uniqueSession = true)
	    public WebDriver webdriver;
	    
	    @Steps
		MyFeatureEndUserSteps myFeature;

	    @Given("^user is logged in with userid \"(.*?)\" and password \"(.*?)\"$")
	    public void user_is_logged_in_with_userid_and_password(String arg1, String arg2) throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	    	myFeature.open_Cyclos_Home_Page();
	    	myFeature.enter_Cyclos_Credentials(arg1, arg2);

	    }

	    @When("^user selects a member and makes payment$")
	    public void user_selects_a_member_and_makes_payment() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	    	myFeature.select_Personal_Contacts();
	    	myFeature.make_Personal_Contact_Payment();
	    }

	    @Then("^paid amount should reflect in beneficiary account$")
	    public void paid_amount_should_reflect_in_beneficiary_account() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	    	myFeature.logout_Current_User();
	    	myFeature.enter_Cyclos_Credentials("pjagtap", "Cap@1234");
	    	myFeature.check_Messages();
	    	
	    }
	    
	    @Given("^I make multiple scheduled payments for selected contact from contacts list$")
	    public void i_make_multiple_scheduled_payments_for_selected_contact_from_contacts_list() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	        
	    }

	    @Given("^I review all transaction details and submits transaction$")
	    public void i_review_all_transaction_details_and_submits_transaction() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions

	    }

	    @When("^I login with beneficiary credential$")
	    public void i_login_with_beneficiary_credential() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	        
	    }

	    @When("^check his/her account on scheduled and Non-scheduled dates for full payment cycle$")
	    public void check_his_her_account_on_scheduled_and_Non_scheduled_dates_for_full_payment_cycle() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	        
	    }

	    @Then("^Transferred amount should be credited in beneficiary account on scheduled dates$")
	    public void transferred_amount_should_be_credited_in_beneficiary_account_on_scheduled_dates() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	        
	    }

	    
	    
	    
	    @Given("^I send an invoice message for selected contact from contacts list$")
	    public void i_send_an_invoice_message_for_selected_contact_from_contacts_list() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions

	    }

	    @Given("^login with beneficiary credential and accept invoice messages$")
	    public void login_with_beneficiary_credential_and_accept_invoice_messages() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions

	    }

	    @When("^I check sender and beneficiary account details$")
	    public void i_check_sender_and_beneficiary_account_details() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions

	    }

	    @Then("^Invoice amount should get debited from sender account and credited to beneficiary  account$")
	    public void invoice_amount_should_get_debited_from_sender_account_and_credited_to_beneficiary_account() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions

	    }
	    


	    @Given("^I make loan repayment for selected loan from loans list$")
	    public void i_make_loan_repayment_for_selected_loan_from_loans_list() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	        
	    }

	    @When("^I select same loan account and check remaining amount of loan$")
	    public void i_select_same_loan_account_and_check_remaining_amount_of_loan() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	        
	    }

	    @Then("^Remaining loan amount should be reduced with repaid amount$")
	    public void remaining_loan_amount_should_be_reduced_with_repaid_amount() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions
	        
	    }




	    @Given("^I send a message to selected contact from contacts list with subject line and text body$")
	    public void i_send_a_message_to_selected_contact_from_contacts_list_with_subject_line_and_text_body() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions

	    }

	    @When("^I Login with receiver credential and check messages$")
	    public void i_Login_with_receiver_credential_and_check_messages() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions

	    }

	    @Then("^Message should be received to receiver$")
	    public void message_should_be_received_to_receiver() throws Throwable {
	        // Write code here that turns the phrase above into concrete actions

	    }

	    @When("^user selects logout$")
	    public void user_selects_logout() throws Throwable {
	    	myFeature.logout_Current_User();
	    }

	    @Then("^user should be back to login page$")
	    public void user_should_be_back_to_login_page() throws Throwable {

	    }

}
