## Holiday Picker Component

![Holiday Picker](/images/holidayFavorites.png)

This project contains components for building a holiday viewer component where a suer can select
from a list of available holidays and add to their favorites.

## Seting up your Environment using Salesforce DX

0. Get Started with Visual Studio Code. Follow the steps in the [Quick Start: Visual Studio Code for Salesforce Development](https://trailhead.salesforce.com/content/learn/projects/quickstart-vscode-salesforce) Trailhead project. The steps include:

-  Install Visual Studio Code
-  Install the Salesforce CLI
-  Use VS Code for Salesforce DEvelopment  

1. Set up your environment. Follow the steps in the [Quick Start: App Development with Salesforce DX](https://trailhead.salesforce.com/en/content/learn/modules/sfdx_app_dev) Trailhead module. The steps include:

-   Salesforce DX
-   Create an App
-   Build an App Using the Salesfsorce CLI
-   Convert and Deploy an Existing App

2. Authenticate with your hub org and provide it with an alias (**myDevHub** in the command below):

```
sfdx force:auth:web:login -d -a myDevHub
```

3. Clone the repository:

```
git clone https://github.com/thegminero/holidayProject.git
cd holidayProject
```

4. Create a scratch org and provide it with an alias (**favoriteHolidays** in the command below):

```
sfdx force:org:create -s -f config/project-scratch-def.json -a favoriteHolidays
```

5. Push the app to your scratch org:

```
sfdx force:source:push
```

6. Open the scratch org:

```
sfdx force:org:open
```

7. In **Setup**, under **User**:

 - Ensure that the user object has a custom field favorite holidays


8. Open the User Holiday's App

![Holiday Picker](/images/holidayApp.png)


9. Enjoy!