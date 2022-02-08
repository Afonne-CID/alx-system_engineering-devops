#!/usr/bin/python3
"""This script gather data from an API -
    Task 1: Return to-do list information for a given employee ID
    Task 2: Export to JSON
"""
import json
import requests
import sys

if __name__ == "__main__":

    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get(url + "users").json()

    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump({
            user.get("id"): [{
                "username": user.get("username"),
                "task": todo.get("title"),
                "completed": todo.get("completed"),
                } for todo in requests.get(url + "todos",
                                           params={"userId": user.get(
                                                   "id")}).json()]
            for user in users},
            jsonfile
        )
