import faker from "faker";
import { classes } from "./../support/helpers";

const characterData = {
	name: faker.name.findName(),
	class: faker.random.arrayElement(classes),
	level: faker.random.number({ min: 1, max: 20 }),
};

describe("Character Sheets", function () {
	it("Creates a new character sheet.", function () {
		// Navigate to the create character sheet form.
		cy.visit("/character-sheets");
		cy.contains("New Character Sheet").click();

		// Fill out the form.
		cy.get('input[name="character_sheet[name]"]').type(characterData.name);
		cy.get('select[name="character_sheet[class]"]').select(characterData.class);
		cy.get('input[name="character_sheet[level]"]').type(characterData.level);

		// Submit the form
		cy.get('button[type="submit"]').click();

		// Verify that the form submitted successfully.
		cy.get(".alert").should(
			"contain.text",
			"Character sheet created successfully."
		);
		cy.contains(characterData.name).should("exist");
	});

	it("Shows an existing character sheet", function () {
		cy.visit("/character-sheets");

		cy.contains(characterData.name).closest("tr").contains("Show").click();

		cy.contains("Show Character Sheet").should("exist");
		cy.contains(characterData.name).should("exist");

		cy.contains("Back").click();

		cy.contains("Character Sheets");
	});

	it("Edits an existing character sheet", function () {
		cy.visit("/character-sheets");

		cy.contains(characterData.name).closest("tr").contains("Edit").click();

		cy.contains("Edit Character Sheet").should("exist");

		cy.get('input[name="character_sheet[name]"]').clear();
		cy.get('button[type="submit"]').click();

		cy.contains("Edit Character Sheet").should("exist");
		cy.get(".alert").should(
			"contain.text",
			"Oops, something went wrong! Please check the errors below."
		);
		cy.contains("can't be blank").should("exist");

		characterData.name = faker.name.findName();
		cy.get('input[name="character_sheet[name]"]').type(characterData.name);
		cy.get('button[type="submit"]').click();

		cy.contains("Show Character Sheet").should("exist");
		cy.get(".alert").should(
			"contain.text",
			"Character sheet updated successfully."
		);
		cy.contains(characterData.name).should("exist");

		// Validate the back button on the Edit form
		cy.visit("/character-sheets");
		cy.contains(characterData.name).closest("tr").contains("Edit").click();
		cy.contains("Back").click();
		cy.contains("Character Sheets").should("exist");
	});

	it("Deletes an existing character sheet", function () {
		cy.visit("/character-sheets");

		cy.on("window:confirm", (str) => {
			expect(str).to.eq("Are you sure?");
			return true;
		});

		cy.contains(characterData.name).closest("tr").contains("Delete").click();
		cy.get(".alert").should(
			"contain.text",
			"Character sheet deleted successfully."
		);
		cy.contains(characterData.name).should("not.exist");
	});
});
