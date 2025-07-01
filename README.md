#  Vending Machine in Verilog

This repository provides a basic Verilog implementation of a vending machine. The machine dispenses an item priced at ₹15. It accepts coins of ₹0, ₹5, and ₹10 denominations, continuously tracks the total amount inserted, and dispenses the item once ₹15 or more has been received. If the inserted amount exceeds ₹15, it also returns the appropriate change.

**#Features**

- Accepts ₹0 (`2'b00`), ₹5 (`2'b01`) and ₹10 (`2'b10`) coins.
- Dispenses item when ₹15 is collected.
- Returns appropriate change if more than ₹15 is inserted.
- FSM-based implementation with 3 states: ₹0, ₹5, ₹10.
