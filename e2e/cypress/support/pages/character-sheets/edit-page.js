const backLink = () => cy.contains("Back");
const nameField = () => cy.get('input[name="character_sheet[name]"]');
const submitButton = () => cy.get('button[type="submit"]');
const errorAlert = () => cy.get(".alert");

class EditPage {
	assert(characterName) {
		cy.contains("Edit Character Sheet");
		nameField().should("have.value", characterName);
	}

	clickBackLink() {
		backLink().click();
	}

	clearNameField() {
		nameField().clear();
	}

	fillInNameField(value) {
		nameField().type(value);
	}

	clickSubmit() {
		submitButton().click();
	}

	assertFormErrors() {
		errorAlert().should(
			"contain.text",
			"Oops, something went wrong! Please check the errors below."
		);
		cy.contains("can't be blank").should("exist");
	}
}

export default new EditPage();
