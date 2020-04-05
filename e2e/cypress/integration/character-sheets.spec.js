import faker from "faker";
import { classes } from "./../support/helpers";

describe("Character Sheets", function () {
	it("Creates a new character sheet.", function () {
		// Navigate to the create character sheet form.
		cy.visit("/character-sheets");
		cy.contains("New Character Sheet").click();

		// Fill out the form.
		const characterName = faker.name.findName();
		cy.get('input[name="character_sheet[name]"]').type(characterName);
		cy.get('select[name="character_sheet[class]"]').select(
			faker.random.arrayElement(classes)
		);
		cy.get('input[name="character_sheet[level]"]').type(
			faker.random.number({ min: 1, max: 20 })
		);

		// Submit the form
		cy.get('button[type="submit"]').click();

		// Verify that the form submitted successfully.
		cy.get(".alert").should(
			"have.text",
			"Character sheet created successfully."
		);
		cy.contains(characterName).should("exist");
	});
});
