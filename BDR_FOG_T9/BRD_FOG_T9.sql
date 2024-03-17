use ejemplo;

CREATE TABLE datos_reg (
    x FLOAT,
    y FLOAT);

INSERT INTO datos_reg (x, y) VALUES
(1, 2),
(2, 3),
(3, 5),
(4, 4),
(5, 6);

DROP TABLE resultados_regresion;

CREATE TEMPORARY TABLE resultados_regresion (
    pendiente FLOAT,
    interseccion FLOAT
);


DELIMITER //

CREATE PROCEDURE calcularRegresionLineal()
BEGIN
    DECLARE media_x FLOAT;
    DECLARE media_y FLOAT;
    DECLARE covarianza_xy FLOAT;
    DECLARE varianza_x FLOAT;
    DECLARE pendiente FLOAT;
    DECLARE interseccion FLOAT;
    
    -- Calcular la media de x
    SELECT AVG(x) INTO media_x FROM datos_reg;
    
    -- Calcular la media de y
    SELECT AVG(y) INTO media_y FROM datos_reg;
    
    -- Calcular la covarianza de x e y
    SELECT SUM((x - mean_x) * (y - mean_y)) INTO covarianza_xy FROM datos_reg;
    
    -- Calcular la varianza de x
    SELECT SUM(POWER((x - mean_x), 2)) INTO varianza_x FROM datos_reg;
    
     -- Verificar si la varianza de x no es cero
    IF varianza_x = 0 THEN
        SELECT 'Error: La varianza de x es cero';
    ELSE
        -- Calcular la pendiente (slope) de la línea de regresión
        SET pendiente = covarianza_xy / varianza_x;
        
    IF media_y = pendiente * media_x THEN
     	SELECT 'Error: La interseccion es 0';
    ELSE
      -- Calcular la intersección en y (intercept) de la línea de regresión
        SET interseccion = media_y - pendiente * media_x;
        
        -- Mostrar los resultados
    INSERT INTO resultados_regresion (pendiente, interseccion) VALUES (pendiente, interseccion);
    END IF;
END //

DELIMITER ;

CALL calcularRegresionLineal();

SELECT * FROM resultados_regresion;