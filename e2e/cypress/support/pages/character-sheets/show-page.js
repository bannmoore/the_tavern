import layout from "./../layout";

const backLink = () => cy.contains("Back");

class ShowPage {
	assert(characterName) {
		cy.contains("Show Character Sheet");
		cy.contains(characterName).should("exist");
	}

	clickBackLink() {
		backLink().click();
	}

	assertCharacterSheetUpdatedAlert() {
		layout.assert_alert("Character sheet updated successfully.");
	}
}

export default new ShowPage();
