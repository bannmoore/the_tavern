import layout from "./../layout";

const backLink = () => cy.contains("Back");
const editLink = () => cy.contains("Edit");

function calculateModifier(abilityScore) {
	let modifier = Math.floor((abilityScore - 10) / 2);
	let sign = modifier >= 0 ? "+" : "";

	return `${sign}${modifier}`;
}

class ShowPage {
	assert(characterName) {
		cy.contains("Show Character Sheet");
		cy.contains(characterName).should("exist");
	}

	clickBackLink() {
		backLink().click();
	}

	clickEditLink() {
		editLink().click();
	}

	assertCharacterSheetUpdatedAlert() {
		layout.assert_alert("Character sheet updated successfully.");
	}

	assertAbilityScore(label, score) {
		cy.contains(`${label}: ${score} (${calculateModifier(score)})`);
	}
}

export default new ShowPage();
