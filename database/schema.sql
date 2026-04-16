-- TourHub Database Schema

CREATE DATABASE IF NOT EXISTS tourhub;
USE tourhub;

-- States table
CREATE TABLE states (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('state', 'ut') NOT NULL,
    best_season ENUM('summer', 'winter', 'monsoon') NOT NULL,
    description TEXT
);

-- Places table
CREATE TABLE places (
    id INT AUTO_INCREMENT PRIMARY KEY,
    state_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    FOREIGN KEY (state_id) REFERENCES states(id) ON DELETE CASCADE
);

-- Place details (10 bullet points)
CREATE TABLE place_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    place_id INT NOT NULL,
    point TEXT NOT NULL,
    FOREIGN KEY (place_id) REFERENCES places(id) ON DELETE CASCADE
);

-- Sample Data: 5 States

INSERT INTO states (name, type, best_season, description) VALUES
('Kerala', 'state', 'winter', 'God\'s Own Country - known for backwaters, beaches, and Ayurveda'),
('Rajasthan', 'state', 'winter', 'Land of Kings - palaces, forts, and desert culture'),
('Himachal Pradesh', 'state', 'summer', 'Mountain state with hill stations and adventure sports'),
('Goa', 'state', 'winter', 'Beach paradise with Portuguese heritage and nightlife'),
('Sikkim', 'state', 'summer', 'Himalayan beauty with monasteries and trekking routes');

-- Kerala Places
INSERT INTO places (state_id, name, description) VALUES
(1, 'Alleppey', 'Venice of the East - famous for houseboats and backwaters'),
(1, 'Munnar', 'Hill station with tea gardens and cool climate'),
(1, 'Kovalam', 'Beach destination with lighthouse and water sports'),
(1, 'Wayanad', 'Wildlife sanctuary with waterfalls and caves'),
(1, 'Fort Kochi', 'Historic port with colonial architecture');

-- Kerala - Alleppey details
INSERT INTO place_details (place_id, point) VALUES
(1, 'Houseboat cruises through serene backwaters'),
(1, 'Traditional Kerala meals served on banana leaf'),
(1, 'Nehru Trophy Boat Race in August'),
(1, 'Coir village showcasing traditional weaving'),
(1, 'Alleppey Beach with historic pier'),
(1, 'St. Mary\'s Orthodox Church dating to 4th century'),
(1, 'Kayaking through narrow canals'),
(1, 'Fresh coconut-based seafood cuisine'),
(1, 'Easy road and rail connectivity from Kochi'),
(1, 'Best visited November to February');

-- Kerala - Munnar details
INSERT INTO place_details (place_id, point) VALUES
(2, 'Vast tea plantations stretching across hills'),
(2, 'Eravikulam National Park - home to Nilgiri Tahr'),
(2, 'Mattupetty Dam for boating activities'),
(2, 'Tata Tea Museum with processing demonstrations'),
(2, 'Anamudi Peak - highest in South India'),
(2, 'Cool climate perfect for summer escape'),
(2, 'Spice plantations offering guided tours'),
(2, 'Kathakali and Mohiniyattam cultural shows'),
(2, 'Accessible via Kochi airport 130km away'),
(2, 'March to May ideal for clear mountain views');

-- Kerala - Kovalam details
INSERT INTO place_details (place_id, point) VALUES
(3, 'Three crescent-shaped beaches'),
(3, 'Historic lighthouse with panoramic views'),
(3, 'Ayurvedic massage centers and spas'),
(3, 'Surfing and parasailing water sports'),
(3, 'Vizhinjam Rock Cut Temple nearby'),
(3, 'Fresh seafood at beach shacks'),
(3, 'Evening cultural performances'),
(3, 'Shopping at local handicraft stores'),
(3, '16km from Thiruvananthapuram airport'),
(3, 'October to March offers calm seas');

-- Kerala - Wayanad details
INSERT INTO place_details (place_id, point) VALUES
(4, 'Edakkal Caves with prehistoric carvings'),
(4, 'Banasura Sagar Dam - largest earthen dam'),
(4, 'Wildlife safari at Wayanad Wildlife Sanctuary'),
(4, 'Soochipara Falls for rock climbing'),
(4, 'Ancient Jain temples at Sulthan Bathery'),
(4, 'Tribal culture and heritage experiences'),
(4, 'Organic spice and coffee plantations'),
(4, 'Traditional Wayanad cuisine with bamboo rice'),
(4, 'Calicut airport 95km, good road network'),
(4, 'October to May best for wildlife spotting');

-- Kerala - Fort Kochi details
INSERT INTO place_details (place_id, point) VALUES
(5, 'Chinese fishing nets - iconic photo spot'),
(5, 'St. Francis Church - oldest European church in India'),
(5, 'Jewish Synagogue with hand-painted tiles'),
(5, 'Dutch Palace showcasing Kerala murals'),
(5, 'Fort Kochi Beach with colonial walkways'),
(5, 'Indo-Portuguese Museum heritage'),
(5, 'Kathakali performances at Kerala Kathakali Centre'),
(5, 'Fusion cuisine reflecting colonial influences'),
(5, 'Well connected by air, rail, and road'),
(5, 'November to February pleasant weather');

-- Rajasthan Places
INSERT INTO places (state_id, name, description) VALUES
(2, 'Jaipur', 'Pink City - capital with forts, palaces, and bazaars'),
(2, 'Udaipur', 'City of Lakes - romantic palaces and waterways'),
(2, 'Jodhpur', 'Blue City - dominated by Mehrangarh Fort'),
(2, 'Jaisalmer', 'Golden City - desert fort and camel safaris'),
(2, 'Pushkar', 'Holy town with Brahma temple and camel fair');

-- Rajasthan - Jaipur details
INSERT INTO place_details (place_id, point) VALUES
(6, 'Amber Fort with elephant rides'),
(6, 'Hawa Mahal - Palace of Winds'),
(6, 'City Palace complex and museums'),
(6, 'Jantar Mantar astronomical observatory'),
(6, 'Albert Hall Museum with Rajasthani art'),
(6, 'Traditional block printing and jewelry bazaars'),
(6, 'Folk dance and puppet shows'),
(6, 'Dal Baati Churma and Rajasthani thali'),
(6, 'Major airport and rail hub'),
(6, 'October to March comfortable temperatures');

-- Rajasthan - Udaipur details
INSERT INTO place_details (place_id, point) VALUES
(7, 'Lake Palace on Pichola waters'),
(7, 'City Palace - largest palace complex'),
(7, 'Jagdish Temple with intricate carvings'),
(7, 'Monsoon Palace hilltop views'),
(7, 'Bagore Ki Haveli cultural museum'),
(7, 'Boat rides on Lake Pichola'),
(7, 'Miniature painting workshops'),
(7, 'Ghevar and Mawa Kachori sweets'),
(7, 'Well connected by air and rail'),
(7, 'Winter months offer clear lake views');

-- Rajasthan - Jodhpur details
INSERT INTO place_details (place_id, point) VALUES
(8, 'Mehrangarh Fort - one of India\'s largest'),
(8, 'Blue-painted Brahmpuri houses'),
(8, 'Jaswant Thada marble cenotaph'),
(8, 'Umaid Bhawan Palace museum'),
(8, 'Clock Tower Market for spices'),
(8, 'Rao Jodha Desert Rock Park'),
(8, 'Traditional Rajasthani folk music'),
(8, 'Mirchi Bada and Pyaaz Kachori'),
(8, 'Domestic airport and rail connectivity'),
(8, 'November to February ideal climate');

-- Rajasthan - Jaisalmer details
INSERT INTO place_details (place_id, point) VALUES
(9, 'Living Fort with residents inside'),
(9, 'Patwon Ki Haveli with carved facades'),
(9, 'Sam Sand Dunes camel safaris'),
(9, 'Desert National Park wildlife'),
(9, 'Gadisar Lake with temples'),
(9, 'Cultural evening at desert camps'),
(9, 'Folk music under starlit sky'),
(9, 'Ker Sangri and desert cuisine'),
(9, 'Airport and rail from Jodhpur'),
(9, 'October to March pleasant desert weather');

-- Rajasthan - Pushkar details
INSERT INTO place_details (place_id, point) VALUES
(10, 'Only Brahma temple in the world'),
(10, 'Holy Pushkar Lake for ritual baths'),
(10, 'Annual Camel Fair in November'),
(10, 'Savitri Temple hilltop shrine'),
(10, 'Varaha Temple ancient architecture'),
(10, 'Yoga and meditation retreats'),
(10, 'Hippy market and boutique shopping'),
(10, 'Vegetarian food and street snacks'),
(10, '3 hours drive from Jaipur'),
(10, 'November has famous camel fair');

-- Himachal Pradesh Places
INSERT INTO places (state_id, name, description) VALUES
(3, 'Manali', 'Hill station with snow peaks and adventure'),
(3, 'Shimla', 'Former summer capital with colonial charm'),
(3, 'Dharamshala', 'Home of Dalai Lama and Tibetan culture'),
(3, 'Kullu', 'Valley of Gods with temples and rafting'),
(3, 'Spiti Valley', 'Cold desert with ancient monasteries');

-- Himachal - Manali details
INSERT INTO place_details (place_id, point) VALUES
(11, 'Rohtang Pass snow activities'),
(11, 'Hadimba Temple wooden architecture'),
(11, 'Solang Valley paragliding and skiing'),
(11, 'Old Manali cafes and hippie culture'),
(11, 'Beas Kund trek for adventurers'),
(11, 'Hot springs at Vashisht village'),
(11, 'Local Kulluvi caps and woolens shopping'),
(11, 'Sidu and Thukpa local dishes'),
(11, 'Bhuntar airport 50km, good buses'),
(11, 'March to June snow-free roads');

-- Himachal - Shimla details
INSERT INTO place_details (place_id, point) VALUES
(12, 'The Ridge and Mall Road shopping'),
(12, 'Jakhoo Temple with monkey population'),
(12, 'Christ Church colonial landmark'),
(12, 'Kufri skiing in winter'),
(12, 'Viceregal Lodge history tours'),
(12, 'Toy Train UNESCO World Heritage'),
(12, 'Summer Festival cultural event'),
(12, 'Chana Madra and Siddu delicacies'),
(12, 'Major rail and bus hub'),
(12, 'April to June escape heat');

-- Himachal - Dharamshala details
INSERT INTO place_details (place_id, point) VALUES
(13, 'Dalai Lama Temple complex'),
(13, 'McLeod Ganj Tibetan markets'),
(13, 'Namgyal Monastery Buddhist studies'),
(13, 'Triund Trek panoramic views'),
(13, 'Cricket Stadium at altitude'),
(13, 'Tibetan cuisine - momos and thukpa'),
(13, 'Meditation and yoga courses'),
(13, 'Thangka painting workshops'),
(13, 'Kangra airport 15km away'),
(13, 'March to June clear mountain views');

-- Himachal - Kullu details
INSERT INTO place_details (place_id, point) VALUES
(14, 'Raghunath Temple ancient shrine'),
(14, 'Beas River white water rafting'),
(14, 'Great Himalayan National Park'),
(14, 'Bijli Mahadev lightning temple'),
(14, 'Manikaran hot springs nearby'),
(14, 'Dussehra Festival world famous'),
(14, 'Local shawls and caps'),
(14, 'Kullu trout and pahadi cuisine'),
(14, 'On NH21, well connected'),
(14, 'May to September accessible');

-- Himachal - Spiti Valley details
INSERT INTO place_details (place_id, point) VALUES
(15, 'Key Monastery 1000 years old'),
(15, 'Chandratal Lake pristine waters'),
(15, 'Pin Valley National Park'),
(15, 'Kibrik - highest motorable village'),
(15, 'Tabo Monastery - Himalayan Ajanta'),
(15, 'Stargazing clear night skies'),
(15, 'Homestays with local families'),
(15, 'Thukpa and butter tea'),
(15, '4WD required, challenging roads'),
(15, 'June to September only accessible');

-- Goa Places
INSERT INTO places (state_id, name, description) VALUES
(4, 'North Goa', 'Party capital with beaches and nightlife'),
(4, 'South Goa', 'Serene beaches and luxury resorts'),
(4, 'Panaji', 'Capital with Portuguese architecture'),
(4, 'Old Goa', 'UNESCO heritage churches'),
(4, 'Arambol', 'Hippy beach with drum circles');

-- Goa - North Goa details
INSERT INTO place_details (place_id, point) VALUES
(16, 'Baga Beach water sports hub'),
(16, 'Calangute Beach - Queen of Beaches'),
(16, 'Anjuna flea market Wednesday'),
(16, 'Fort Aguada Portuguese lighthouse'),
(16, 'Chapora Hill sunset views'),
(16, 'Casinos on Mandovi River'),
(16, 'Nightclubs - Tito\'s, Mambo\'s'),
(16, 'Goan fish curry and Vindaloo'),
(16, 'Dabolim airport 40km'),
(16, 'November to February best weather');

-- Goa - South Goa details
INSERT INTO place_details (place_id, point) VALUES
(17, 'Palolem Beach crescent shaped'),
(17, 'Colva Beach white sands'),
(17, 'Cabo de Rama Fort views'),
(17, 'Dudhsagar Falls nearby'),
(17, 'Luxury beach resorts'),
(17, 'Silent peaceful atmosphere'),
(17, 'Ayurvedic spas'),
(17, 'Fresh seafood shacks'),
(17, 'Taxi and bus available'),
(17, 'October to March ideal');

-- Goa - Panaji details
INSERT INTO place_details (place_id, point) VALUES
(18, 'Fontainhas Latin Quarter'),
(18, 'Church of Immaculate Conception'),
(18, 'Mandovi River promenade'),
(18, 'Goa State Museum'),
(18, 'Old Secretariat building'),
(18, 'Local markets for souvenirs'),
(18, 'Carnival celebrations'),
(18, 'Bebinca and Feni specialties'),
(18, 'Central bus stand, airport nearby'),
(18, 'November to February pleasant');

-- Goa - Old Goa details
INSERT INTO place_details (place_id, point) VALUES
(19, 'Basilica of Bom Jesus - St. Francis Xavier'),
(19, 'Se Cathedral largest in Asia'),
(19, 'Church of St. Francis of Assisi'),
(19, 'Archaeological Museum'),
(19, 'UNESCO World Heritage Site'),
(19, 'Baroque architecture tours'),
(19, 'Religious heritage walks'),
(19, 'Vegetarian Goan meals available'),
(19, '10km from Panaji'),
(19, 'Year-round, avoid monsoon');

-- Goa - Arambol details
INSERT INTO place_details (place_id, point) VALUES
(20, 'Hippy community gathering spot'),
(20, 'Drum circle every evening'),
(20, 'Sweet water lake nearby'),
(20, 'Cliff diving at high tide'),
(20, 'Yoga and meditation shalas'),
(20, 'Budget beach huts'),
(20, 'Alternative lifestyle culture'),
(20, 'Organic and vegan cafes'),
(20, 'Bus from Mapusa'),
(20, 'November to March best');

-- Sikkim Places
INSERT INTO places (state_id, name, description) VALUES
(5, 'Gangtok', 'Capital with monasteries and views'),
(5, 'Pelling', 'Hill station with Kanchenjunga views'),
(5, 'Lachung', 'Gateway to North Sikkim'),
(5, 'Nathula Pass', 'Indo-China border with history'),
(5, 'Yumthang Valley', 'Valley of Flowers');

-- Sikkim - Gangtok details
INSERT INTO place_details (place_id, point) VALUES
(21, 'MG Road pedestrian only'),
(21, 'Rumtek Monastery important shrine'),
(21, 'Enchey Monastery 200 years old'),
(21, 'Cable car to Tashi Viewpoint'),
(21, 'Himalayan Zoological Park'),
(21, 'Local handicrafts and carpets'),
(21, 'Buddhist festivals'),
(21, 'Momos and Thenthuk noodles'),
(21, 'Bagdogra airport 124km'),
(21, 'March to June clear views');

-- Sikkim - Pelling details
INSERT INTO place_details (place_id, point) VALUES
(22, 'Kanchenjunga panoramic views'),
(22, 'Pemayangtse Monastery 300 years'),
(22, 'Skywalk glass bridge'),
(22, 'Khecheopalri Lake sacred'),
(22, 'Darap village traditional culture'),
(22, 'Rimbi River picnic spot'),
(22, 'Orchid viewing spring season'),
(22, 'Sikkimese and Nepali cuisine'),
(22, 'Shared jeeps from Gangtok'),
(22, 'April to June best visibility');

-- Sikkim - Lachung details
INSERT INTO place_details (place_id, point) VALUES
(23, 'Yumthang Valley day trip'),
(23, 'Zero Point snow activities'),
(23, 'Lachung Monastery 19th century'),
(23, 'Bhimsen Falls nearby'),
(23, 'Hot springs at Yumthang'),
(23, 'Homestay experiences'),
(23, 'Local Lepcha culture'),
(23, 'Gundruk and Sinki dishes'),
(23, 'Permit required, shared jeeps'),
(23, 'April to June accessible');

-- Sikkim - Nathula Pass details
INSERT INTO place_details (place_id, point) VALUES
(24, 'Historic Silk Route trade pass'),
(24, 'Indo-China border experience'),
(24, 'War memorial for soldiers'),
(24, 'Snow covered most of year'),
(24, 'Permit from Gangtok required'),
(24, 'Tsomgo Lake en route'),
(24, 'Baba Harbhajan Singh Temple'),
(24, 'Packed meals provided'),
(24, 'Organized tours only'),
(24, 'May to October open');

-- Sikkim - Yumthang Valley details
INSERT INTO place_details (place_id, point) VALUES
(25, 'Alpine flowers spring bloom'),
(25, 'Rhododendron varieties'),
(25, 'Yumthang River meadows'),
(25, 'Yak grazing pastures'),
(25, 'Snow peaks backdrop'),
(25, 'Photography paradise'),
(25, 'Hot spring bathing'),
(25, 'Simple local food stalls'),
(25, 'Day trip from Lachung'),
(25, 'April to May flower season');
