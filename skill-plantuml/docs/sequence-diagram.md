# Sequence diagram

## Usage

[PlantUML Sequence Diagram](https://plantuml.com/en/sequence-diagram)

## Sequence Diagram Specification

**autonumber Rules**:

- Add `autonumber` after `@startuml` for automatic numbering.

**activation Rules**:

- Use `activate`/`deactivate` to display participant activation status during calls between
  participants

**actor Rules**:

- Set default background color of `actor` to `#Orange`.
  **database Rules**:
- Set default background color of `database` to `#LightGreen`.
- Requests to the database must include the table name (e.g., `SELECT * FROM xxx` or `INSERT INTO xxx`) to indicate
  which
  table is being accessed.

**box Rules**:

- Set default background color of `box` to `#LightBlue`.
- Background color goes **after** the box title, e.g., `box box_title #LightBlue`, not `box #LightBlue box_title`.
- If the box contains changes such as business logic judgments and branches, use `#FFB6C1` instead of `#LightBlue`.

**participant Rules**:

- Participants not wrapped by a box should be colored `#LightBlue`; participants wrapped by a box
  should not be colored separately (inherit the box color).

**alt/else Rules**:

- It is highly recommended to add condition judgments for alt and else if possible

**arrow Rules**:

- Use the `-[#color]>` syntax to change the arrow color.
