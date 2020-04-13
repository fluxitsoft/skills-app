# skills-app
[GraphQL](https://graphql.org/) API built with [Flask](https://graphql.org/), MySQL, [SQLAlchemy](https://www.sqlalchemy.org/), [Graphene](https://graphene-python.org/) and Python 3.7

This app works with 3 basic entities (user, profile, skill) that are exposed via a GraphQL API. 

## Prerequisites

 - Python 3.7
 - Pip 3
 - Virtualenv
 - Docker
 - Docker Compose

## Installation

After cloning the project create a virtual environment and activate it:

```bash
    $ virtualenv venv
    $ source venv/bin/activate
```

Install dependencies from *requirements.txt*:

```bash
    (venv) $ pip3 install -r requirements.txt
```

## Run
This application is deployed in its own Docker image and the example DB is in a MySQL image. In order to run them both, there's a Docker Compose yml file ready to go:

```bash
    $ docker-compose build
    $ docker-compose run
```

To test the application, access http://localhost:5000/graphql

## Examples

This application implements both data mutation and queries. For example, the following mutation creates a user:


```javascript
    mutation {
      mutateUser(username: "mrbrown", name: "Quentin", lastName: "Tarantino") {
        user {
          username
          name
          lastName
        }
      }
    }
```

Then with another mutation a profile with skills can be created for the previous user:

```javascript
   mutation {
      mutateProfile(description: "Javascript developer since forever", role: "JS Developer", userId: 1, skills: [{
          name: "JavaScript",
          score: 5
      }, {
          name: "TypeScript",
          score: 2
      }]) {
          profile {
              description
              role
              skills {
                  name
                  score
              }
          }
      }
  }
```
This is an example query filtering by username and score, projecting only the user's name, profile's role and all information about skills:

```javascript
  {
      users(username: "mrbrown") {
          name
          profile {
              role
              skills(score: 2) {
                  name
                  score
              }
          }
      }
  }
```

## References

- [How to GraphQL](https://www.howtographql.com/)
- [Graphene docs](https://docs.graphene-python.org/en/latest/)
- [GraphQL vs Rest API architecture](https://medium.com/swlh/graphql-vs-rest-api-architecture-3b95a77512f5)
