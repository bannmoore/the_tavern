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
};

describe("Character Sheets", function () {
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

	it("Shows an existing character sheet", function () {
		indexPage.visit();

		indexPage.clickCharacterShowLink(characterData.name);
		showPage.assert(characterData.name);

		showPage.clickBackLink();
		indexPage.assert();
	});

	it("Edits an existing character sheet", function () {
		indexPage.visit();

		indexPage.clickCharacterEditLink(characterData.name);

		editPage.assert(characterData.name);

		editPage.clearNameField();
		editPage.clickSubmit();

		editPage.assert("");
		editPage.assertFormErrors();

		characterData.name = faker.name.findName();
		editPage.fillInNameField(characterData.name);
		editPage.clickSubmit();

		showPage.assert(characterData.name);
		showPage.assertCharacterSheetUpdatedAlert();

		indexPage.visit();
		indexPage.clickCharacterEditLink(characterData.name);
		editPage.assert(characterData.name);
		editPage.clickBackLink();
		indexPage.assert();
	});

	it("Deletes an existing character sheet", function () {
		indexPage.visit();

		indexPage.assertDeleteConfirmationPopUp();

		indexPage.clickCharacterDeleteLink(characterData.name);
		indexPage.assertCharacterSheetDeletedAlert();
		indexPage.refuteCharacterIsListed(characterData.name);
	});
});
