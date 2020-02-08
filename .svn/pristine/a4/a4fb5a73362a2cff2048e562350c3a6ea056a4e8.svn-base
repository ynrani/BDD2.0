// JSFormValidation.js
/*
 * Run init() after the page is loaded
 */
window.onload = init;
 
/*
 * Initialization
 */
function init() {
   // Bind "onsubmit" event handler to the "submit" button
   document.getElementById("formTest").onsubmit = validateForm;
   // Bind "onclick" event handler to "reset" button
   document.getElementById("btnReset").onclick = clearForm;
   // Set initial focus
   document.getElementById("txtName").focus();
}
 
/*
 * The "onsubmit" event handler to validate the input fields.
 * @param theForm: the form to be validated
 */
function validateForm(theForm) {
   with(theForm) {
      // return false would prevent default submission
      return (isNotEmpty(txtName, "Please enter user name!", elmNameError)
           && isNotEmpty(txtPassword, "Please Enter Password", elmPasswordError)
          && isNotEmpty(adminFlagID, "Please Enter Admin Flag!", elmadminFlagError)
         
      );
   }
}
 
/*
 * Helper function, to be called after validation, to show or clear
 * existing error message, and to set focus to the input element
 * for correcting error.
 * If isValid is false, show the errMsg on errElm, and place the
 * focus on the inputElm for correcting the error.
 * Else, clear previous errMsg on errElm, if any.
 *
 * @param isValid (boolean): flag indicating the result of validation
 * @param errMsg (string)(optional): error message
 * @param errElm (object)(optional): if isValid is false, show errMsg; else, clear.
 * @param inputElm (object)(optional): set focus to this element,
 *        if isValid is false
 */
function postValidate(isValid, errMsg, errElm, inputElm) {
   if (!isValid) {
      // Show errMsg on errElm, if provided.
      if (errElm !== undefined && errElm !== null
            && errMsg !== undefined && errMsg !== null) {
         errElm.innerHTML = errMsg;
      }
      // Set focus on Input Element for correcting error, if provided.
      if (inputElm !== undefined && inputElm !== null) {
         inputElm.classList.add("errorBox");  // Add class for styling
         inputElm.focus();
      }
   } else {
      // Clear previous error message on errElm, if provided.
      if (errElm !== undefined && errElm !== null) {
         errElm.innerHTML = "";
      }
      if (inputElm !== undefined && inputElm !== null) {
         inputElm.classList.remove("errorBox");
      }
      
   }
   
   
}
 
/*
 * Validate that input value is not empty.
 *
 * @param inputElm (object): input element
 * @param errMsg (string): error message
 * @param errElm (object): element to place error message
 */
function isNotEmpty(inputElm, errMsg, errElm) {
   var isValid = (inputElm.value.trim() !== "");
   postValidate(isValid, errMsg, errElm, inputElm);
   return isValid;
}
 


 
/*
 * The "onclick" handler for the "reset" button to clear the display,
 * including the previous error messages and error box.
 */
function clearForm() {
   // Remove class "errorBox" from input elements
   var elms = document.querySelectorAll('.errorBox');  // class
   for (var i = 0; i < elms.length; i++) {
      elms[i].classList.remove("errorBox");
   }
 
   // Remove previous error messages
   elms = document.querySelectorAll('[id$="Error"]');  // id ends with Error
   for (var i = 0; i < elms.length; i++) {
      elms[i].innerHTML = "";
   }
 
   // Set initial focus
   document.getElementById("txtName").focus();
}