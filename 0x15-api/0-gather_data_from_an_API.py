#!/usr/bin/python3
"""This script gather data from an API -
    Task: Return to-do list information for a given employee ID
"""
import requests
import sys

if __name__ == "__main__":
    user_id = sys.argv[1]
    url = "https://jsonplaceholder.typicode.com/"
    name = requests.get(url + "users/{}".format(user_id)).json().get(
            "name")
    todos = requests.get(url + "todos", params={"userId": user_id}).json()

    done = [todo.get("title") for todo in todos
            if todo.get("completed") is True]
    print("Employee {} is done with tasks({}/{}):".format(
           name, len(done), len(todos)))
    [print("\t {}".format(each)) for each in done]
