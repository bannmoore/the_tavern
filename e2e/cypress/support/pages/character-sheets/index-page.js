import layout from "./../layout";

const getNewCharacterSheetLink = () => cy.contains("New Character Sheet");
const getCharacterShowLink = (name) =>
	cy.contains(name).closest("tr").contains("Show");
const getCharacterEditLink = (name) =>
	cy.contains(name).closest("tr").contains("Edit");
const getCharacterDeleteLink = (name) =>
	cy.contains(name).closest("tr").contains("Delete");

class IndexPage {
	visit() {
		cy.visit("/character-sheets");
	}

	assert() {
		cy.contains("Character Sheets");
	}

	clickNewCharacterSheetLink() {
		getNewCharacterSheetLink().click();
	}

	clickCharacterShowLink(name) {
		getCharacterShowLink(name).click();
	}

	clickCharacterEditLink(name) {
		getCharacterEditLink(name).click();
	}

	clickCharacterDeleteLink(name) {
		getCharacterDeleteLink(name).click();
	}

	assertCharacterSheetCreatedAlert() {
		layout.assert_alert("Character sheet created successfully.");
	}

	assertCharacterSheetDeletedAlert() {
		layout.assert_alert("Character sheet deleted successfully.");
	}

	assertCharacterIsListed(name) {
		cy.contains(name).should("exist");
	}

	refuteCharacterIsListed(name) {
		cy.contains(name).should("not.exist");
	}

	assertDeleteConfirmationPopUp() {
		cy.on("window:confirm", (str) => {
			expect(str).to.eq("Are you sure?");
			return true;
		});
	}
}

export default new IndexPage();
