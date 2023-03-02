-- CTE common table expression 
WITH cte_join(userID, name, prodName, price) 
AS
(
   SELECT u.userID
		, b.prodName
        , b.price
	 FROM buytbl AS b
     JOIN usertbl AS u
	   ON b.userID = userID
)

SELECT * FROM cte_join;