component extends='cfPaymillTests.BaseTestBundle' {
	function beforeAll() {
		super.beforeAll();
	}

	function afterAll() {
		super.afterAll();
	}

	function run() {
		super.run();

		describe('Payment...', function() {
			beforeEach(function(currentSpec) {});

			afterEach(function(currentSpec) {});

			describe('...addPayment()...', function() {
				beforeEach(function(currentSpec) {});

				afterEach(function(currentSpec) {});

				it('...with token (#variables.token#).', function() {
					var payment = application.cfPaymill.addPayment(token=variables.token);

					variables.paymentID = payment.data.id;

					statusTest(payment);
					paymentTest(payment.data, '^pay_*'
						,variables.type
						,variables.card_type
						,variables.country
						,variables.last4
						,variables.expiryMonth
						,variables.expiryYear);
					dateTest(payment.data.created_at);
					dateTest(payment.data.updated_at);
				});
			});

			describe('...getPayment()...', function() {
				beforeEach(function(currentSpec) {});

				afterEach(function(currentSpec) {});

				it('...with Payment ID.', function() {
					var payment = application.cfPaymill.getPayment(variables.paymentID);

					statusTest(payment);
					paymentTest(payment.data, '^pay_*'
						,variables.type
						,variables.card_type
						,variables.country
						,variables.last4
						,variables.expiryMonth
						,variables.expiryYear);
					dateTest(payment.data.created_at);
					dateTest(payment.data.updated_at);
				});
			});

			describe('...getPayments()...', function() {
				beforeEach(function(currentSpec) {});

				afterEach(function(currentSpec) {});

				it('...returns an array of payments.', function() {
					var payment = application.cfPaymill.getPayments();

					statusTest(payment);

					expect(payment.data).toBeArray();
				});
			});

			describe('...deletePayment()...', function() {
				beforeEach(function(currentSpec) {});

				afterEach(function(currentSpec) {});

				it('...with Payment ID.', function() {
					var payment = application.cfPaymill.deletePayment(variables.paymentID);

					statusTest(payment);
					expect(payment.data).toBeArray();
					expect(payment.data).toBeEmpty();
				});
			});
		});
	}
}