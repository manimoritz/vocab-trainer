# User Story

## Purpose

The user has **latin** vocabulary that he must learn. This app is for learning how to **conjugate** the verbs
of said vocabulary.

## Home Screen

In the home screen, the user has three options:

1. Conjugate Verbs
2. Add a new Verb
3. Display all Verbs

## 1. Conjugating Verbs

In this screen, a randomly selected verb gets displayed with its
[four principle parts](https://en.wikipedia.org/wiki/Principal_parts#Latin),
and a desired form is displayed (eg. Second-Person Singular Present Active Indicative).
The user then has to type the verb in the desired form, and then submit.
If the user is correct, a green flair is displayed.
If the user is incorrect, a red flair and the right form are displayed.

## 2. Adding Verbs

In this screen, the user adds the verbs one by one.
He inputs the four principle parts of the verb.
Then, all conjugated form of the verb get automatically generated. If there is a discrepancy
between the auto-generated form and the form on wiktionary, the user is shown a table
with all forms, and the discrepancies are marked in yellow.
The user can then correct the forms and submit.
If there are no discrepancies, all forms are submitted automatically.
Only on **submission** are verb and all its forms saved.
The user is then prompted to add the next verb.
He can exit this screen by clicking a button

## 3. Displaying all Verbs

In this screen, all of the verbs the user has added are displayed as a list.
Each verb is an entry that can be edited or deleted.
Upon editing, the same logic as in the creating step applies, so all forms get regenerated.
If there are no discrepancies, the verb and all forms are saved, if there are discrepancies,
the forms must be manually revised and submitted, and only then is the verb updated.

# Steps until Feature Complete

* In the conjugation table:
  * Make a tooltip that displays the wiktionary form.
  * Fully color the individual cells (right now the input field is white)
* When creating new verbs:
  * Only show the conjugation table when the conjugation_list function has discrepancies
  * Otherwise, directly bulk_create the forms
  * Only save the verb **if the bulk_create action has been executed and was successful**
* Add "Display all Verbs" screen:
  * Add update action that functions analogous to the create action.
  * Add destroy action that destroys the verb and all its forms.

# Possible Future Steps:

* Add settings for:
  * Choosing light / dark mode
  * Limiting the possible forms to be displayed (eg. only ask Indicative, or only Present and Future)
  * Limiting the verbs that get randomly chosen (eg. assign groups to verbs, and only study group 1)
* Add other languages (eg. Italian, Spanish, Japanese?)

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
