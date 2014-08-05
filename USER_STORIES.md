# Features

This application provides a record of a given legislator's voting history and sponsored-bill success rates.

Main menu:
- View legislator
- View legislation

View legislator menu:
- (List) legislators or enter a legislator's name to view an individual record.
  - Individual legislator: Puts name, affiliation, hometown, Prompts to select (All) sessions or an individual session
    - View voting record, sponsored bill success rate, or cross-party voting rate
    - Voting record: List bills (number, name, yea/nay/pnv, pass/fail, date)
    - Sponsored bill success rate:  Puts percentage, List bills (number, name, pass/fail)
    - Cross-party voting rate: Puts percentage, List bills (number, name, pass/fail)

View legislation menu:
- Enter a bill number (ie HB1000 or SB2000).
  - View name, summary, list of sponsors, session, date it passed

# User Types

* Constituents:  Those with an interest in learning more about an individual legislator's voting record.

# Stories

## Constituent views an individual legislator's profile

As a constituent
In order to participate in democracy
I want to view a legislator's profile.

Acceptance Criteria:
* Constituent navigates through the menu and enters a legislator's name to view his/her details
* Displays the legislator in question

## Constituent views an individual legislator's voting record

As a constituent
In order to learn about a legislator
I want to view his/her voting record.

Acceptance Criteria:
* Builds on the individual legislator's profile
* Constituent navigates through the menu and enters a legislator's name to view his/her details
* Displays the legislator in question
* Prompts to select the timeframe (all time or specific session)
* Lists bills (number, name, yea/nay/pnv, pass/fail, date)

## Constituent views an individual legislator's sponsored-bill success rate

As a constituent
In order to learn about a legislator
I want to view his/her sponsored-bill success rate.

Acceptance Criteria:
* Builds on the individual legislator's profile
* Constituent navigates through the menu and enters a legislator's name to view his/her details
* Displays the legislator in question
* Prompts to select the timeframe (all time or specific session)
* Puts percentage (passed sponsored bills/sponsored bills)
* Displays sponsored bills (number, name, pass/fail)

## Constituent views an individual legislator's cross-party voting rate

As a constituent
In order to learn about a legislator
I want to view his/her cross-party voting rate.

Acceptance Criteria:
* Builds on the individual legislator's profile
* Constituent navigates through the menu and enters a legislator's name to view his/her details
* Displays the legislator in question
* Prompts to select the timeframe (all time or specific session)
* Puts percentage (yea on bills put forth by sponsor of opposite party/all yeas)
* Displays cross-party bills (number, name, pass/fail)

## Constituent views an individual bill

As a constituent
In order to be more informed
I want to view individual bills.

Acceptance Criteria:
* Constituent navigates through the menu and inputs a bill number to view its details
* Displays the bill in question
* Displays the bill's name, summary, sponsors, session, and the date it passed.
