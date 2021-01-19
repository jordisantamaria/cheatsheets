from dataclasses import dataclass, astuple, field


@dataclass
class InventoryItem:
    """Class for keeping track of an item in inventory."""
    name: str
    unit_price: float
    quantity_on_hand: int = 0

    def total_cost(self) -> float:
        return self.unit_price * self.quantity_on_hand


a = InventoryItem(name="inventory1", unit_price=3, quantity_on_hand=5)
print(astuple(a))

@dataclass
class C:
    a: float
    b: float
    c: float = field(init=False)

    def __post_init__(self):
        self.c = self.a + self.b

c = C(a = 2, b = 3)
print(c)