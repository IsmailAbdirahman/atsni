# Old Instagram App
This is a recreation of the old Instagram app using Flutter for the frontend and Node.js and MongoDB for the backend. The architecture used is the Feature First Layer Architecture, which aims to improve code maintainability and scalability.

# Features
User authentication (login, sign up, logout)
Feed with posts from users followed by the authenticated user
Post creation with image and caption
User profile with the list of user's posts and information
Follow and unfollow users
Architecture
The Feature First Layer Architecture divides the code into layers based on features. Each feature has its own directory containing all the necessary code (UI, business logic, data access) to implement that feature. This approach improves code organization, testability, and scalability.

# Frontend
The frontend is built with Flutter, a mobile development framework that allows building native apps for Android and iOS using a single codebase. The UI is implemented using Flutter widgets, and the state management is handled by the Riverpod package.

# Backend
The backend is built with Node.js, a JavaScript runtime, and uses the Express framework for handling HTTP requests. The database used is MongoDB, a NoSQL document-based database. The authentication is implemented using JSON Web Tokens (JWT).

# Screenshot: 

<img src="https://github.com/IsmailAbdirahman/atsni/assets/56909567/7586f3af-12a4-4d3a-84d0-e2f3677c6bf7" width="300" height="790">


<img src="https://github.com/IsmailAbdirahman/atsni/assets/56909567/e9947d57-a922-4cf1-b13d-bdde32887ea7" width="300" height="790">

<img src="https://github.com/IsmailAbdirahman/atsni/assets/56909567/de27f4eb-79be-412d-9a27-6afa4918f3ea" width="300" height="790">







