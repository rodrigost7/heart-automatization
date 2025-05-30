from faker import Faker
from datetime import date

class IdadeGenerator:
    def __init__(self, locale='pt_BR'):
        self.fake = Faker(locale)

    def gerar_idade(self, idade_min=15, idade_max=100):
        data_nascimento = self.fake.date_of_birth(minimum_age=idade_min, maximum_age=idade_max)
        hoje = date.today()
        idade = hoje.year - data_nascimento.year - (
            (hoje.month, hoje.day) < (data_nascimento.month, data_nascimento.day)
        )
        return idade