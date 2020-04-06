const backLink = () => cy.contains("Back");
const nameField = () => cy.get('input[name="character_sheet[name]"]');
const abilityField = (ability) =>
	cy.get(`input[name="character_sheet[ability_${ability}]"]`);
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
		nameField().clear();
		nameField().type(value);
	}

	fillInAbilityField(ability, value) {
		const field = abilityField(ability);
		field.clear();
		field.type(value);
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
