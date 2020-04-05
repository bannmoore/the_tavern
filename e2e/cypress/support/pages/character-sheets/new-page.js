const nameField = () => cy.get('input[name="character_sheet[name]"]');
const classField = () => cy.get('select[name="character_sheet[class]"]');
const levelField = () => cy.get('input[name="character_sheet[level]"]');
const submitButton = () => cy.get('button[type="submit"]');

class IndexPage {
	assert() {
		cy.contains("New Character Sheet").should("exist");
	}

	fillInNameField(value) {
		nameField().type(value);
	}

	fillInClassField(value) {
		classField().select(value);
	}

	fillInLevelField(value) {
		levelField().type(value);
	}

	clickSubmit() {
		submitButton().click();
	}
}

export default new IndexPage();
