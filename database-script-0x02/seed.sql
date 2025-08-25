INSERT INTO Users (user_id, first_name, last_name, email, password_hash, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_123', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_456', 'host'),
('33333333-3333-3333-3333-333333333333', 'Admin', 'User', 'admin@example.com', 'hashed_pw_789', 'admin');

-- Insert Properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment', 'Nice 2-bedroom apartment in city center', 'Paris, France', 120.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Beach House', 'Seaside villa with private pool', 'Nice, France', 250.00);

-- Insert Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 480.00, 'confirmed');

-- Insert Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES
('ppppppp1-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 480.00, 'credit_card');

-- Insert Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES
('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! Super clean and cozy.');

-- Insert Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES
('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hello, is the apartment available for next month?');
