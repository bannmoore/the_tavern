import faker from "faker";
import { classes } from "./../support/helpers";
import {
	characterSheetEditPage as editPage,
	characterSheetIndexPage as indexPage,
	characterSheetNewPage as newPage,
	characterSheetShowPage as showPage,
} from "./../support/pages";

const characterData = {
	name: faker.name.findName(),
	class: faker.random.arrayElement(classes),
	level: faker.random.number({ min: 1, max: 20 }),
	abilities: {
		str: fakeAbilityScore(),
		dex: fakeAbilityScore(),
		con: fakeAbilityScore(),
		int: fakeAbilityScore(),
		wis: fakeAbilityScore(),
		cha: fakeAbilityScore(),
	},
};

function fakeAbilityScore() {
	return faker.random.number({ min: 0, max: 30 });
}

describe("Character Sheets", function () {
	describe("Create character sheet", function () {
		it("Creates a new character sheet.", function () {
			indexPage.visit();
			indexPage.clickNewCharacterSheetLink();

			newPage.assert();

			newPage.fillInNameField(characterData.name);
			newPage.fillInClassField(characterData.class);
			newPage.fillInLevelField(characterData.level);

			newPage.clickSubmit();

			indexPage.assert();
			indexPage.assertCharacterSheetCreatedAlert();
			indexPage.assertCharacterIsListed(characterData.name);
		});
	});

	describe("Edit character sheet", function () {
		it("Navigates to index page after clicking Back link", function () {
			indexPage.visit();
			indexPage.clickCharacterEditLink(characterData.name);
			editPage.assert(characterData.name);

			editPage.clickBackLink();
			indexPage.assert();
		});

		it("Displays warning after submitting with errors", function () {
			indexPage.visit();
			indexPage.clickCharacterEditLink(characterData.name);
			editPage.assert(characterData.name);

			editPage.clearNameField();
			editPage.clickSubmit();

			editPage.assert("");
			editPage.assertFormErrors();
		});

		it("Redirects to the show page after submitting valid data", function () {
			indexPage.visit();
			indexPage.clickCharacterEditLink(characterData.name);
			editPage.assert(characterData.name);

			characterData.name = faker.name.findName();
			editPage.fillInNameField(characterData.name);
			editPage.fillInAbilityField("str", characterData.abilities.str);
			editPage.fillInAbilityField("dex", characterData.abilities.dex);
			editPage.fillInAbilityField("con", characterData.abilities.con);
			editPage.fillInAbilityField("int", characterData.abilities.int);
			editPage.fillInAbilityField("wis", characterData.abilities.wis);
			editPage.fillInAbilityField("cha", characterData.abilities.cha);

			editPage.clickSubmit();

			showPage.assert(characterData.name);
			showPage.assertAbilityScore("STR", characterData.abilities.str);
			showPage.assertAbilityScore("DEX", characterData.abilities.dex);
			showPage.assertAbilityScore("CON", characterData.abilities.con);
			showPage.assertAbilityScore("INT", characterData.abilities.int);
			showPage.assertAbilityScore("WIS", characterData.abilities.wis);
			showPage.assertAbilityScore("CHA", characterData.abilities.cha);
			showPage.assertCharacterSheetUpdatedAlert();
		});
	});

	describe("Show character sheet", function () {
		it("Shows an existing character sheet", function () {
			indexPage.visit();

			indexPage.clickCharacterShowLink(characterData.name);
			showPage.assert(characterData.name);

			showPage.clickBackLink();
			indexPage.assert();
		});

		it("Navigates to edit page after clicking Edit link", function () {
			indexPage.clickCharacterShowLink(characterData.name);
			showPage.assert(characterData.name);
			showPage.clickEditLink();
			editPage.assert(characterData.name);
		});
	});

	describe("Delete character sheet", function () {
		it("Deletes an existing character sheet", function () {
			indexPage.visit();

			indexPage.assertDeleteConfirmationPopUp();

			indexPage.clickCharacterDeleteLink(characterData.name);
			indexPage.assertCharacterSheetDeletedAlert();
			indexPage.refuteCharacterIsListed(characterData.name);
		});
	});
});
