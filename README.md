[![Build Status](https://travis-ci.org/arttrackd/arttrackd.svg?branch=master)](https://travis-ci.org/arttrackd/arttrackd)
[![Coverage Status](https://coveralls.io/repos/arttrackd/arttrackd/badge.svg?branch=master&service=github)](https://coveralls.io/github/arttrackd/arttrackd?branch=master)

#ArtTrack

ArtTrack is a business management tool for self employed artists. It provides the artist with the ability to create and work on projects, manage inventory, create and track sales of projects, set income goals for all sales or just sales from a specific venue, and view at-a-glance data about their overall business performance. Getting started is easy: Just sign up with your name, email, password and set your hourly rate. Then, if you'd like, view your profile and set a custom profile picture.

![The dashboard provides an overview of your recent business activity.](http://i.imgur.com/GHCIXbe.png)



Features
+ [Inventory Management](#inventory-management)
+ [Tracking Your Projects](#tracking-your-projects)
+ [Rate and Pricing Calculator](#rate-and-pricing-calculator)
+ [Tracking Your Sales](#tracking-your-sales)
+ [Tracking Your Goals](#tracking-your-goals)
+ [Tracking Your Business Costs](#tracking-your-business-costs)

##<a id="inventory-management">Inventory Management</a>

In the 'My Inventory' section, the artist can enter materials they purchased for use on projects and view a list of all of them. On a material listing, they can upload a receipt image if they want. If the artist enters more than one unit at a time, the app will calculate the price per unit and display that with the material entry. After the artist applies the material to a project, the amount remaining will be updated and displayed.

##<a id="tracking-your-projects">Tracking Your Projects</a>

In the 'My Projects' section, the artist can view all of their projects and create new projects. During project creation process, or by editing the project record later, the artist can add materials from their inventory. When creating a project, the artist enters a name, and optionally a description or as many materials or costs unique to the project (such as shipping & handling, licensing fees, or commission) as they want. If the project is sold, the total sales revenue for the project is displayed on the 'My Projects' page. On the specific project's page, there is a time tracking feature using the Clock In and Clock Out buttons.

##<a id="rate-and-pricing-calculator">Rate and Pricing Calculator</a>

If the project is not sold and there are not any time entries yet, there is an estimated value displayed on the project's page that is a total of the costs of the materials used. When the artist clicks the Clock In button on the specific project's page, a timer appears in the top bar of the screen and a time entry begins for that artist's project. The artist can navigate the website and the timer will persist on every page. On any page, the artist can click the Clock Out button on either the top bar, or on the individual project's page. The time entry is recorded and can be edited later. The time entries are also totaled for easy reference. When the time entry is saved, the estimated value of the project is updated based on the time worked times the hourly rate of the artist. That dollar amount is added to the cost of the materials used, if there are any, to update the estimated value.

##<a id="tracking-your-sales">Tracking Your Sales</a>

The artist can track sales by marking a project as sold from the specific project's page or the 'My Projects' page. The artists enters the gross profit, the date of the sale, and optionally the sales venue. The most recent sale will appear at the top of the 'My Sales' page. The gross sale amount, as well as the net profit, and the sales channel, if applicable, are displayed on the 'My Sales' page. Projects that have been sold cannot be deleted unless their sale records are deleted first. From the 'My Sales' page, the artist can navigate to the 'My Sales Channels' page and add any sales channels they want to apply to a sale later.

##<a id="tracking-your-goals">Tracking Your Goals</a>

The artist's most recent goal progress is shown on the 'Dashboard' and every goal is shown on the 'My Goals' page. New sales goals are created on the 'My Goals' page, and are set as a dollar amount to be achieved during a period of time, with an optional sales channel where you want to generate revenue. The 'My Goals' page shows progress towards each goal as a bar graph, and you can toggle to see only ended sales goals, where the end date has passed. The 'Dashboard' shows the latest sales goal as a donut and can express the percentage of the progress towards the goal from 0% to over 100%. The 'Dashboard' shows the percentage of revenue from sales at the sales channel where the artist has had sales, shown as a pie chart. Each sale record created will update these graphs on the 'Dashboard' if applicable.

##<a id="tracking-your-business-costs">Tracking Your Business Costs</a>

The artist can track miscellaneous costs that do not apply to any specific project on the 'My Costs' page (such as studio rent or price of gas to a business related event). The artist sets name, cost, due date, and optional description when they create a new expense.
