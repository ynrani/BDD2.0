package net.serenity.cucumber;

import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;
@RunWith(CucumberWithSerenity.class)
@CucumberOptions(features="src/test/resources/features/MessageToMember/MessageToMember.feature")
public class MessageToMember {

}
