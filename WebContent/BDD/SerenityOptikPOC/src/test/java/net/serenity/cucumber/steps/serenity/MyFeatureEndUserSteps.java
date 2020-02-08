package net.serenity.cucumber.steps.serenity;

import net.serenity.cucumber.pages.CyclosHomePage;
import net.thucydides.core.steps.ScenarioSteps;
/*
import net.thucydides.core.annotations.BlurScreenshots;
import net.thucydides.core.annotations.Screenshots;
import net.thucydides.core.annotations.Step;
import net.serenity.cucumber.pages.OptikHomePage;
import net.serenitybdd.core.Serenity;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.hasItem;
*/
public class MyFeatureEndUserSteps extends ScenarioSteps {
	CyclosHomePage cyclosPage;

	public void enter_Cyclos_Credentials(String arg1, String arg2) {
		// TODO Auto-generated method stub
		cyclosPage.enterCyclosCredentials(arg1, arg2);
	}

	public void open_Cyclos_Home_Page() {
		// TODO Auto-generated method stub
		cyclosPage.open();
		cyclosPage.getDriver().manage().window().maximize();
	}

	public void select_Personal_Contacts() {
		// TODO Auto-generated method stub
		cyclosPage.selectPersonalContacts();
	}

	public void make_Personal_Contact_Payment() {
		// TODO Auto-generated method stub
		cyclosPage.makePersonalContactPayment();
	}

	public void logout_Current_User() {
		// TODO Auto-generated method stub
		cyclosPage.logoutCurrentUser();
	}

	public void check_Messages() {
		// TODO Auto-generated method stub
		cyclosPage.checkMessages();
	}

	
/*    @Step
//    @Screenshots(onlyOnFailures=true)
	public void opens_optik_home_page(){
    	optikPage.open();
    	optikPage.getDriver().manage().window().maximize();
    	Serenity.takeScreenshot();
	}
    
	@Step
//	@BlurScreenshots("HEAVY")
	public void login_Optik(String arg1, String arg2) {
		optikPage.enter_Optik_Credentials(arg1, arg2);
	}

	@Step
	public void login_Submit() {
		optikPage.submit_Optik_Credentials();
	}
	
*/
}