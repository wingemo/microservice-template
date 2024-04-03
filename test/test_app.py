import unittest
import sys
import os

# Lägg till 'src' i Python-sökvägen
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'src')))

from app import app

class TestApp(unittest.TestCase):
    def setUp(self):
        # Skapa en klient för att göra förfrågningar till vår Flask-applikation
        self.app = app.test_client()
        # Ställ in variabeln som indikerar att vi kör i testläge
        app.testing = True

    def test_hello_world(self):
        # Gör en GET-förfrågan till rot-URL:en '/'
        response = self.app.get('/')
        # Kontrollera att svarsstatuskoden är 200 OK
        self.assertEqual(response.status_code, 200)
        # Kontrollera att innehållet i svaret är det förväntade 'Hello, World!'
        self.assertEqual(response.data.decode('utf-8'), 'Hello, World!')

if __name__ == '__main__':
    unittest.main()
