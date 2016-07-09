# Simon Says Lab

![Drawing](http://i.imgur.com/e1ep3LE.jpg?1)

> If you obey all the rules, you miss all the fun. -[Katharine Hepburn](https://en.wikipedia.org/wiki/Katharine_Hepburn)

b b g r r 
## Simon Says: Do This Lab

Remember the game [Simon](https://en.wikipedia.org/wiki/Simon_\(game\))? Simon was an electronic game popular in the 1980s. The toy would play a sequence of colors, and you had to press buttons corresponding to the colors in the same order as the sequence given.

In this lab, you're going to recreate the game Simon.

Don't worry: Most of the game logic has been written for you. You simply have to design the interface and set up the right Interface Builder outlets and actions to make the game work.

Here's what the UI should look like when the game initially loads:

![Simon UI](http://i.imgur.com/J70uWbC.png)

There is one button in the center, **Start Game**, that will show a sequence of colors in a view just above the button. (Initially, this view is hidden from the user.) The UI also consists of four buttons, one in each corner, and each one a different color: Red, Green, Yellow, and Blue, as shown.

There is also a hidden label beneath the **Start Game** button that will let the user know if they won or lost the game.

When the user presses **Start Game**, a sequence of colors will be shown in the (initially hidden) view just above the **Start Game** button. After the sequence is shown, the user will be able to press the colored buttons. If they press them in the correct order, they win, and see this screen:

![Simon: You won!](http://i.imgur.com/9ZXBrYH.png)

If they press them in the wrong order, though, they will see this:

![Simon: You lost!](http://i.imgur.com/xIryCfI.png)

Let's get to it!

Start by opening up `SimonSaysLab.xcworkspace`. You'll see that some parts of the view controller have already been started for you, as has a bit of the main UI (in `Main.storyboard`). You'll have to fill in the rest.

## Game Engine

A game engine has already been implemented for you. It is created as the `simonSaysGame` instance variable in the view controller. It has a number of methods already implemented for you that you will find useful:

* There are `guessRed()`, `guessGreen()`, `guessYellow()`, and `guessBlue()` methods written. You can call these when the user makes a guess.
* There is a `gameWon()` method that will return `true` if the user has made the correct guesses, and `false` if they haven't.

You can use these methods from the view controller to make guesses and determine if a user has won or lost.

Remember that you can use Xcode's autocomplete function to help you write code. If you type `simonSaysGame.`, you'll get a list of methods you can call on `simonSaysGame`. Select one, and the code will be filled in for you! Try it out.

![SimonSays Autocomplete](http://i.imgur.com/1uL9nMt.png)

## View Controller

The view controller has a few IB outlets already created. `displayColorView` is a connection to the view that displays the colored sequence. It is already connected to the appropriate view, and you don't need to worry about it. The `startGameButton` outlet has already been created and connected, too. `winLabel` is already created and connected to the label that tells the user if they guessed correctly or not.

The view controller also has a couple more instance variables. `simonSaysGame` is a reference to the game engine, and `buttonsClicked` records the number of buttons that have been clicked so far, which you may find to be helpful in implementing this application.

## View

The view in `Main.storyboard` has also been partially set up for you. You'll see there is a **Start Game** button. It is already connected to the `startGameTapped(_:)` IB action in the view controller. The label indicating whether the user has one or lost has been created for you, too, and connected as an IB outlet.

## Your Tasks

There's still a lot of work to be done, though. Here's what you need to do to finish this lab:

1. Create a colored button in each corner of the UI.
	* These buttons should be roughly 100 pixels by 100 pixels square. Remember: You can drag their size handles to change their size, or change them in the Attributes Inspector.
	* They have no text, so you should remove the default text.
	* Finally, you should change their background colors. This can also be done in the Attributes Inspector.
2. Create IB actions for each of the colored buttons in the view controller, and wire them up to these actions.
3. Hide the `winLabel` when the view initially loads. It shouldn't be shown until the game is over.
4. Fill in the logic for the IB actions you created in \#2. When a button is tapped, you should let the game engine know that a guess has been made. For example, when the yellow button is tapped, you should call `simonSaysGame.guessYellow()` to record that guess. Do this for each of the buttons. Remember that you can use Xcode's autocomplete function to help you with this code; it will suggest methods you can call on `simonSaysGame` to record these guesses.
5. Once you can determine if the user has won or lost, change the text in the `winLabel` to indicate if the user won or lost. Remember, `simonSaysGame` has a `gameWon()` method that will return `true` if the user won the game.
6. If your game is up and running, give yourself a pat on the back. Depending on how you implemented the methods to make `simonSaysGame` work with your buttons, you might see a lot of repetition with your code. Think of ways you could make your code more readable with less repetition. If you see yourself copying and pasting the same code over and over again, look to create a helper function that can perform these repetitive tasks for you. The argument(s) to this helper function should be the difference(s) between the repeated code.

You may find this lab to be challenging, but if you use everything you've learned in previous labs, you can complete it. Simon Says: Make this app work!

<a href='https://learn.co/lessons/OutletLab' data-visibility='hidden'>View this lesson on Learn.co</a>
