import System.IO

-- Conversión de números a palabras en español
numeroAPalabra :: Int -> String
numeroAPalabra n
  | n < 20 = ["Cero", "Uno", "Dos", "Tres", "Cuatro", "Cinco", "Seis", "Siete", "Ocho", "Nueve", "Diez",
              "Once", "Doce", "Trece", "Catorce", "Quince", "Dieciséis", "Diecisiete", "Dieciocho", "Diecinueve"] !! n
  | n < 100 = let decenas = ["Veinte", "Treinta", "Cuarenta", "Cincuenta", "Sesenta", "Setenta", "Ochenta", "Noventa"]
              in decenas !! (n `div` 10 - 2) ++ if n `mod` 10 /= 0 then " y " ++ numeroAPalabra (n `mod` 10) else ""
  | n == 100 = "Cien"
  | otherwise = "Fuera de rango"

-- Implementación alternativa de FizzBuzz en español
fizzBuzzAlternativo :: Int -> String
fizzBuzzAlternativo n = case (n `mod` 3 == 0, n `mod` 5 == 0) of
  (True, False) -> "Buzz!"
  (False, True) -> "Fizz!"
  (True, True) -> "FizzBuzz!"
  _ -> numeroAPalabra n

-- Proceso principal con mensajes en español
main :: IO ()
main = do
  putStrLn "Ingrese un número entre 0 y 100:"
  numStr <- getLine
  let num = read numStr :: Int
  putStrLn $ case num of
    _ | num < 0 || num > 100 -> "El número está fuera de rango."
    _ -> fizzBuzzAlternativo num
