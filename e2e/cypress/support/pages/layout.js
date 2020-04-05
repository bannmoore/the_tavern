const alert = () => cy.get(".alert");

class Layout {
	assert_alert(message) {
		alert().should("contain.text", message);
	}
}

export default new Layout();
