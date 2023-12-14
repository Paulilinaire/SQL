USE `ClassicModels` ;

-- QUESTION 1 : Afficher les noms, prénoms et titres de l’ensemble des employées en les ordonnant par leurs noms de famille.
SELECT lastName, firstName, jobTitle FROM employees ORDER BY lastName;

-- QUESTION 2 : Afficher les noms des employées en supprimant les doublons.
SELECT DISTINCT lastName FROM  employees;

-- QUESTION 3 : Sélectionner et afficher le nom de la société, le prénom et le nom du contact des clients qui habitent aux USA.
SELECT customerName, contactLastName, contactFirstName FROM customers WHERE country = 'USA'; 

-- QUESTION 4 : Sélectionner les emails des employées qui ont un firstname qui se termine par 'y' et qui ont un reportsTo qui commence par '105'.
SELECT email, reportsTo FROM employees WHERE reportsTo LIKE '105_' AND firstName LIKE '%y';

-- QUESTION 5 : Sélectionner les noms et emails des employees qui ont un firstname qui commence par un L.
SELECT lastName, email FROM employees WHERE firstName LIKE 'L%';

-- QUESTION 6 : Trier la table customers par ordre alphabétique à partir du contactLastName.
SELECT * FROM customers ORDER BY contactLastName;

-- QUESTION 7 : Trier la table employées par ordre croissant en se basant officeCode.
SELECT * FROM employees ORDER BY officeCode;

-- QUESTION 8 : Sélectionner les clients qui ont payé pour plus de 100000 euros.
SELECT customerName, amount
FROM customers
INNER JOIN payments ON Payments.customerNumber = Customers.customerNumber
WHERE amount > 100000; 
-- autre solution
SELECT DISTINCT (SELECT customerName from customers WHERE customerNumber = pay.customerNumber)
FROM payments AS pay
WHERE amount > 100000;

-- QUESTION 9 : Afficher le total des ventes par 'orderNumber' et 'status'. 
SELECT orderDetails.orderNumber, status, SUM(priceEach * quantityOrdered) AS totalSold
FROM orderDetails
INNER JOIN orders ON orderDetails.orderNumber = Orders.orderNumber
GROUP BY orderNumber;

-- QUESTION 10 : Afficher les “orderNumber”, “productName”, “msrp”, “priceEach” des produits qui un productcode = ‘S10_1678’ ont un msrp supérieur au priceEach.
SELECT orderNumber, productName, msrp, priceEach, products.productCode
FROM OrderDetails
INNER JOIN Products ON Products.productCode = OrderDetails.productCode
WHERE Products.productCode LIKE 'S10_1678' AND msrp > priceEach;

-- QUESTION 11 : Sélectionner les emails des employées qui ont un firstname qui se termine par 'y' ou qui appartiennent à au bureau de San Francisco.
SELECT email
FROM employees
INNER JOIN Offices ON Employees.officeCode = Offices.officeCode
WHERE firstname LIKE 'y%' OR city = 'San Francisco';

-- QUESTION 12 : Donner le nombre de client qui sont gérés par Leslie Jennings.
SELECT COUNT(customerNumber) AS customersOfLeslieJennings
FROM employees
INNER JOIN Customers ON employeeNumber = salesRepEmployeeNumber
WHERE lastName = 'Jennings' AND firstName = 'Leslie';

-- QUESTION 13 : Afficher le nom et prénom de la personne qui a le jobTitle de Président
SELECT lastName, firstName 
FROM employees
WHERE jobTitle = 'President';

-- QUESTION 14 : Donner la somme des montants des paiements reçu pendant le mois de Mars 2005.
SELECT SUM(amount) AS totalMarchPayments
FROM payments
WHERE paymentDate BETWEEN '2005-03-01' AND '2005-03-31';

-- QUESTION 15 : Afficher le total des paiements par nom des clients.
SELECT customerName, SUM(amount) AS totalPaymentsByClient
FROM customers
INNER JOIN Payments ON Customers.customerNumber = Payments.customerNumber
GROUP BY customerName;

-- QUESTION 16 : Afficher la date de commande et le numéro client des commandes annulées.
SELECT orderDate, customers.customerNumber, status
FROM orders
INNER JOIN Customers ON Customers.customerNumber = Orders.customerNumber
WHERE status = 'cancelled';

-- QUESTION 17 : Afficher la liste (prénom et nom ) des subordonnées de Bow Anthony.
SELECT firstName, lastName
FROM employees
WHERE reportsTo = (SELECT employeeNumber FROM Employees WHERE firstName = 'Anthony' AND lastName = 'Bow');

-- QUESTION 18 : Afficher le nom et le prénom du ou des employés qui n'ont pas de supérieur hiérarchique.
SELECT firstName, lastName
FROM employees
WHERE reportsTo IS NULL;

-- QUESTION 19 :Dans le detail des commandes afficher la commande avec la plus petite quantité.
SELECT * FROM orderDetails WHERE orderDetails.quantityOrdered = (SELECT MIN(quantityOrdered)FROM orderDetails);

-- QUESTION 20 : Afficher le detail de la commande qui est datée du 21-04-2003.
SELECT *
FROM orderDetails
INNER JOIN orders ON orderDetails.orderNumber = orders.orderNumber
WHERE orderDate = '2003-04-21';

-- QUESTION 21 : Afficher la liste des managers avec les employées qu’ils managent. Le nom de la colonne s’appellera ‘Manager’
-- pour la colonne des managers, elle regroupera leurs noms et prénoms. Idem pour la colonne employée, elle s’appellera ‘Employée’, elle affichera le nom et prénom des employés
SELECT CONCAT(m.lastname,' ',m.firstname) AS Managers,
       CONCAT(e.lastname,' ',e.firstname) AS Employees	
FROM employees e
INNER JOIN employees m ON m.employeeNumber = e.reportsTo
ORDER BY managers;

-- QUESTION 22 : Afficher le nom des managers et le nombre d’employé qu’ils managent.
SELECT CONCAT(m.lastname,' ',m.firstname) AS Managers,
       COUNT(CONCAT(e.lastname,' ',e.firstname)) AS numberEmployees	
FROM employees e
INNER JOIN employees m ON m.employeeNumber = e.reportsTo
GROUP BY managers
ORDER BY managers;










