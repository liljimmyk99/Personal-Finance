# Personal Finance

A MacOS project for managing and tracking personal finances.

## Overview
This repository was meant to add a friendly UI to a task I do multiple times a week, expense tracking.  Personally, I like to manually track my expenses so that way I know where every single dollar I spend goes.  Currently I use a Google Sheet to enter my data but the usability could be improved to speed up the process of inputting transactions and my income.  By no means am I an Excel or Google Sheets experts, but I know enough to be dangerous.  I do though know how to code and felt I could do way more with an application than I could a spreadsheet.

## White Boarding Materials

### FigJam Board
https://www.figma.com/board/3IbL0DZNRKwLWSupgyWoPy/Finance-Tracking-App-Ideation?node-id=0-1&t=62WzZjXvto9U1l1J-1

### Figma Designs
https://www.figma.com/design/qXzu9lNWjXqEBwcXf8ZUFn/Financial-Tracking-App?node-id=101-6&t=enkjJVLACmPDoluc-1


## Current Status: 11/11/2025
This project was conceptualized in 2023 when I began my journey as a SwiftUI developer, I initially created a FigJam board to outline use cases and define an MVP.  As of today I have completed all elements of the MVP, but not 100% to my liking.  It is enough as a proof of concept and ready for a rewrite.  There are a few features I would like to add/redo

- [ ] UI Overview --> Way too much spacing and icons are too big
- [ ] Implement Firebase authentication
- [ ] Implement Swift Charts to visualize spending by category and month to month
- [ ] Implement Machine Learning Model to project spending in the coming months based on current spend
- [ ] Parse an Excel Sheet to mass import expenses
- [ ] Export contents of DB to a Excel Sheet

## Features
- Track income and expenses
- Viewing Expenses in 3 different views
    - In a Calendar
    - In a running List
    - In a list by month

## Getting Started
1. Clone the repository
2. Install dependencies
3. Configure your XCode settings
4. Start tracking your finances

## Built using
- [GRDB](https://github.com/groue/GRDB.swift.git)
- SwiftUI


## Contributing
Contributions are welcome. Please submit pull requests or open issues for bugs and feature requests.