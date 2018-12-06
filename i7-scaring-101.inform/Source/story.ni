"Scaring 101" by Mikrokosmonaut

Chapter 1 - Engine

[This section outlines active/passive states for NPCs. It also outlines the concept of a victim - someone with a fear-state. Victims start off being asleep. It also defines a toy - our possessed companion.]
Section 1 - People

A person can be active or passive.

A toy is a kind of person. A toy is usually active. A toy can be discovered or undiscovered. A toy is usually undiscovered.
A victim is a kind of person. A victim is usually passive.

A fear-state is a kind of value. The fear-states are asleep, confused, unsettled and scared. A victim has a fear-state. A victim is usually asleep. Understand the fear-state property as describing a victim. The description of a victim is usually "[The noun] [if the noun is asleep]is sleeping[otherwise]looks [one of]quite[or]fairly[or]pretty[at random] [fear-state][end if].".

[To replace is a verb.

Describing relates various text to one fear-state. The verb to replace means the describing relation.

"baffled", "bewildered", "bemused", "confused" and "disconnected" replace confused.]

Before printing the name of a victim (called target) while printing room description details:
	say "[unless the target is asleep][fear-state of the target][otherwise]sleeping[end if] ".

[This section categorises things as either hauntable or unhauntable. All hauntable things have a non-empty text called 'weirdness', which describes the behaviour they exhibit.]
Section 2 - Hauntable Things

[As the interest of this game is not really in item descriptions, I decided to interfere with the standard item response.]
A thing can be either hauntable or unhauntable. A thing has some text called weirdness. The weirdness of a thing is usually "". The description of a thing is usually "The finer details of human possessions are of little interest to [us].".

Definition: a thing is hauntable unless the weirdness of it is "".
Definition: a thing is unhauntable if it is not hauntable.

[Devices]
A device can be hauntable or unhauntable. A device is usually unhauntable. A device has some text called weirdness. The weirdness of a device is usually "".

[Beds]
[Each victim should be assigned a bunk.]
A bunk is a kind of enterable open unopenable fixed in place container. The indefinite article of a bunk is "the". The weirdness of a bunk is usually "As you haunt [the noun], [it] starts to shake back and forth.". A victim has a bunk called quarters.

For printing room description details of a bunk (called space):
	if the space contains a victim (called inhabitant):
		say " (under the covers of which [is-are a list of victims contained by the space])";
		omit contents in listing;
	otherwise:
		stop.

[Doors]
The weirdness of a door is usually "[The noun] [if closed]slowly creaks open[otherwise]violently slams shut[end if].". The description of a door is "[The noun] is [if open]open[otherwise]closed[end if].".

[Containers]
The weirdness of a container is usually "[The noun] [if closed]slowly opens revealing [a list of things contained by the noun][otherwise]closes with a slam[end if].". Before printing the name of an open container which is not a bunk, say "open ". For printing room description details of a container: stop.

[Supporters]
The weirdness of a supporter is usually "[The noun] starts to shake aggressively[if the number of things supported by the noun is greater than 0] causing [the list of things supported by the noun] to rattle[end if].".

[Lights]
An illuminator is a kind of device. The weirdness of an illuminator is usually "[The noun] flickers on and off randomly for a few seconds.".

[Windows]
A window is a kind of thing. It is scenery. The description of a window is usually "It's night outside. The best time for scaring.". The weirdness of a window is usually "[The noun] starts to rattle.".

[This section outlines one of the few actions available to the player - haunting. The idea is that the player finds interest trying different combinations of haunting.]
Section 3 - Haunting

[A point is awarded to the player every time they manage to cause a victim's fear-state to change. As there are 4 distinct fear-states, and all victims start out as asleep, this allows for a maximum of 3 points to be earned for each victim in the game. Points are sacrificed every time the player causes a victim to skip a fear-state.]
Use scoring.

[This flag is used to clean up paragraph spacing after all of the actions have been printed. It is reset after each turn.]
break-required is a truth state which varies. break-required is initially false.

Haunting is an action applying to one thing.

Understand "haunt [something]" as Haunting.
Understand "possess [something]" or "take over [something]" or "occupy [something]" or "inhabit [something]" as Haunting.

[A rule to stop the player from doing anything other than the few actions set out.]
Instead of doing something other than waiting, looking, examining, going or haunting:
	say "[We]['re] a poltergeist. [We]['re] not in the business of [action name part of the current action].".

[Although the player is the only actor that will be doing any haunting, the addition of 'an actor' allows for NPC inclusion should this ever be adapted.]
Check an actor haunting something unhauntable:
	say "[We] can't haunt [the noun].";
	stop the action.

Carry out an actor haunting:
	say "[weirdness of the noun][paragraph break]".

[Although this should probably be done using an After rule, I've put these in Report rules so as to avoid incurring individual 'continue the action' statements for each one.]
Report an actor haunting a device:
	now the noun is switched on.
	
Report an actor haunting something openable:
	if the noun is open:
		now the noun is closed;
	otherwise:
		now the noun is open.
	
Report an actor haunting the ball:
	if the ball is in the landing:
		move the ball to the Hallway;
	otherwise:
		move the ball to the Landing.
		
Report an actor haunting the clothes:
	if the clothes are in the closet:
		now the clothes are in the child's bedroom;
		now the printed name of the clothes is "scattered clothes".
		
Report an actor haunting the jack-in-box:
	if the jack-in-box is unsprung:
		now the jack-in-box is sprung.
		
Report an actor haunting a supporter:
	if the number of things supported by the noun is greater than 0 and a random chance of 1 in 3 succeeds:
		let R be a random thing supported by the noun;
		move R to the holder of the noun;
		say "[The R] falls to the floor.";
		now break-required is false;
		say "Haunting supporter: set break to true [run paragraph on]";
	
[This bit lists the behavioural definitions for haunting generic furniture. The idea is that each kind of behaviour will affect the victims in individual ways.

Creepy behavior confuses and wakes up nearby victims who are asleep, but creeps out anyone else in the vicinity.

Scary behavior unsettles and wakes up nearby victims who are asleep, but scares anyone else in the vicinity.

Loud behavior scares nearby victims, waking up everyone in the house who is asleep. Victims who are not nearby will wake up confused.]
Haunting a bunk is scary behavior.
Haunting an illuminator is creepy behavior.
Haunting a window is creepy behavior.
Haunting a closed door is creepy behavior.
Haunting an open door is loud behavior.
Haunting a closed container is creepy behavior.
Haunting an open container which is not a bunk is loud behavior.
Haunting a supporter is creepy behavior.

[A few custom verbs]
To wake is a verb.
To head is a verb.
To scream is a verb.

[Creepy behavior
L: a list of visible victims who are woken up
M: a list of visible victims who are now unsettled 
N: a list of visible victims who were already unsettled
O: a list of visible victims who were already scared]
After creepy behavior:
	let anomaly be the noun;
	let L be a list of victims;
	let M be a list of victims;
	let N be a list of victims;
	let O be a list of victims;
	repeat with target running through victims which can see the anomaly:
		now break-required is true;
		if the target is asleep:
			add target to L;
			now the target is confused;
			increment the score;
		otherwise if the target is confused:
			add target to M;
			increment the score;
			now the target is unsettled;
		otherwise if the target is unsettled:
			add target to N;
		otherwise:
			add target to O;
	if the number of entries in L is greater than 0:
		let T be "[L with definite articles]" in sentence case;
		say "[T] [wake] up wondering what is going on. [run paragraph on]";
	if the number of entries in M is greater than 0:
		let T be "[M with definite articles]" in sentence case;
		say "[T] [look] a little shaken. [run paragraph on]";
	if the number of entries in N is greater than 0:
		let T be "[N with definite articles]" in sentence case;
		say "[T] [look] unsettled enough as it is. [run paragraph on]";
	if the number of entries in O is greater than 0:
		let T be "[O with definite articles]" in sentence case;
		say "[T] [are] scared enough as it is. [run paragraph on]";
	continue the action.

[Loud behavior
L: a list of visible victims who are woken up
M: a list of visible victims who were already awake]
After loud behavior:
	let anomaly be the noun;
	let L be a list of victims;
	let M be a list of victims;
	repeat with target running through victims which can see the anomaly:
		now break-required is true;
		if the target is asleep:
			add target to L;
			now the target is unsettled;
			increment the score;
		otherwise:
			add target to M;
			unless the target is scared, increment the score;
			now the target is scared;
	repeat with target running through victims which are asleep:
		now the target is confused;
		increment the score;
	if the number of entries in L is greater than 0:
		let T be "[L with definite articles]" in sentence case;
		say "[T] [wake] up with a start. [run paragraph on]";
	if the number of entries in M is greater than 0:
		let T be "[M with definite articles]" in sentence case;
		say "[T] [jump] with fright. [run paragraph on]";
	continue the action.
	
[Scary behavior
L: a list of visible victims who are woken up
M: a list of visible victims who are now scared]
After scary behavior:
	let anomaly be the noun;
	let L be a list of victims;
	let M be a list of victims;
	repeat with target running through victims which can see the anomaly:
		now break-required is true;
		if the target is asleep:
			add target to L;
			now the target is unsettled;
			increment the score;
		otherwise:
			add target to M;
			unless the target is scared, increment the score;
			now the target is scared;
	if the number of entries in L is greater than 0:
		let T be "[L with definite articles]" in sentence case;
		say "[T] [wake] up not quite sure of what's going on. [run paragraph on]";		
	if the number of entries in M is greater than 0:
		let T be "[M with definite articles]" in sentence case;
		say "[T] [scream]. [run paragraph on]";
	continue the action.

[Some rules to modify the standard behavior of people in the game.]
Section 4 - Custom Actions

[Allow the player to move through closed doors.]
Instead of going a direction (called way):
	let target location be the room way of the location;
	if the target location is not nothing:
		say "[We] shimmer through to [the target location].";
		move the player to the target location;
		the rule succeeds;
	otherwise:
		say "[We] can't go that way.".

[Allow the player to enter and exit as a ghost would.]
Entering simply is an action applying to nothing.
Understand the command "enter" as something new.
Understand "enter" as entering simply.

Instead of entering simply:
	try going inside.
	
Instead of exiting:
	try going outside.
	
[Suggestion: Add some code to allow the player to go through doors]

[A kludge to make sure victim movement doesn't mess up paragraph spacing.]
After an actor entering a bunk when the player can see the actor:
	now break-required is false;
	continue the action.

[Describe victim movement making sure the teddy bear anticipates it, so as not to get caught in the act.]
After an actor switching off a device when the actor can be seen by the player:
	say "With [if the fear-state of the actor is unsettled]an[otherwise]a[end if] [fear-state of the actor] look on [if the actor is male]his[otherwise]her[end if] face, [the actor] [switch] [the noun] off. [run paragraph on]";
	now break-required is true;
	continue the action;
	
After an actor exiting when the actor can be seen by the player:	
	say "[if the actor is mentioned and the actor is female]She then[otherwise if the actor is mentioned]He then[otherwise][The actor][end if] [if the actor is the young boy and Run to Mommy is happening]leaps out[otherwise]gets out[end if] of [the container exited from]. [run paragraph on]";
	now break-required is false;
	continue the action.

After an actor which is not the teddy bear going a direction:
	if the teddy bear can be seen by the actor and the actor is a victim:
		if the teddy bear can be seen by the player:
			say "[The teddy bear] collapses to the floor in anticipation of someone coming. [run paragraph on]";
		now break-required is false;
		now the teddy bear is passive;
	continue the action.
		
After an actor which is not the teddy bear going a direction:
	if the player can see the actor:
		say "[The actor] [arrive] from [the room gone from], looking quite [fear-state of the actor].";
		now break-required is false;
	continue the action;

After an actor which is not the teddy bear going a direction:
	if the room gone from is the location of the player:
		let bearing be the best route from the room gone from to the room gone to, using doors;
		let origin be "[the room gone from]" in lower case;
		let destination be "[the room gone to]" in lower case;
		say "[if the actor is mentioned and the actor is female]She promptly[otherwise if the actor is mentioned]He promptly[otherwise][The actor][end if] [if the actor is the young boy and Run to Mommy is happening]runs[otherwise][head][end if] [if the bearing is inside]into[otherwise if the bearing is outside]out into[otherwise]towards[end if] [destination], looking fairly [fear-state of the actor].";
		now break-required is false;

[Custom descriptions for the teddy bear.]	
After the teddy bear going a direction when the player can see the teddy bear:
	let bearing be the best route from the room gone from to the room gone to, using doors;
	let origin be "[the room gone from]" in lower case;
	let destination be "[the room gone to]" in lower case;
	say "[The teddy bear] [if the room gone from encloses a victim which is not asleep]quietly crawls[otherwise]waddles[end if] [if the bearing is outside]out [end if]into [destination] from [origin]. [run paragraph on]";
	now break-required is true;
	
[Initial description of the teddy bear]
After printing the name of the teddy bear while printing the locale description of the noun:
	if Sound Asleep is happening:
		say " with a bored look on his face".
	
After printing the name of the passive teddy bear while printing the locale description of the noun:
	say " (currently playing dead)".
	
After printing the name of the teddy bear when Finding Teddy is happening:
	now the teddy bear is discovered.
	
[Custom response for getting back into bed.]
standard report entering rule response (C) is "[The actor] [get] into [the noun] and pulls the covers over [if the actor is male]himself[otherwise]herself[end if] with [if the fear-state of the actor is unsettled]an[otherwise]a[end if] [fear-state of the actor] look on [if the actor is male]his[otherwise]her[end if] face.".

[Various rules to control NPCs.]
Section 5 - Every Turn Rules

[Have the teddy bear follow the player around unless the player is in a room with a victim who is awake.]
Every turn when the teddy bear is not visible and the teddy bear is discovered:
	let current location be the location of the teddy bear;
	let target location be the location of the player;
	let way be the best route from the current location to the target location, using doors;
	unless the room way from the current location encloses a victim which is not asleep:
		try the teddy bear going way.

[Have victims move around to switch off devices. This code is loose in that it assumes anyone who is awake is aware of any device that is switched on. As this game contains only loud devices, that's not a big problem.]
Every turn when a device is switched on:
	repeat with disturbance running through switched on devices:
		let P be a random not asleep victim which can see the disturbance;
		if P is not nothing:
			try P switching off the disturbance;
			now P is passive;
		otherwise:
			let P be a random active victim;
			if P is nothing:
				let P be a random victim which is not asleep;
				if P is nothing, the rule fails;
				now P is active;
			let current location be the location of P;
			let target location be the location of the disturbance;
			let way be the best route from the current location to the target location, using doors;
			if P is enclosed by a bunk:
				try P exiting;
			otherwise:
				try P going way.

[Have victims go back to bed once there's nothing left to turn off.]				
Every turn:
	Repeat with target running through passive victims:
		let Q be the quarters of the target;
		if the target is not enclosed by Q:
			if Q can be seen by the target:
				try the target entering Q;
			otherwise:
				let current location be the location of the target;
				let target location be the holder of Q;
				let way be the best route from the current location to the target location, using doors;
				try the target going way;

[Make sure the teddy bear becomes passive as soon as someone wakes up.]
Every turn when a victim which is not asleep can see the active teddy bear:
	if the teddy bear can be seen by the player:
		say "[The teddy bear] immediately [one of]collapses[or]drops[purely at random] to the floor to [one of]avoid being noticed[or]evade suspicion[purely at random]. [run paragraph on]";
		now break-required is true;
	now the teddy bear is passive.

[Allows the teddy bear to become active again the turn after it becomes safe.]	
Every turn when the teddy bear is passive:
	unless the teddy bear can be seen by a victim:
		if the teddy bear can be seen by the player:
			say "[If the teddy bear is mentioned]He then[otherwise][The teddy bear][end if] awkwardly gets to his feet. [run paragraph on]";
			now break-required is true;
		now the teddy bear is active.

[Every so often, when it's safe, the teddy bear will whisper advice to the player on how to continue.]	
Every turn:
	if the player can see the active teddy bear and a random chance of 1 in 5 succeeds:
		say "'[one of]Keep in mind[or]Don't forget[or]It's worth giving a little thought to[purely at random] [one of]rule #1: always consider your surroundings[or]rule #2: make sure to take your time[or]rule #3: variety is vital to a good haunt[at random]' [if the teddy bear is mentioned]he whispers[otherwise]whispers [the teddy bear][end if].";
		now break-required is false;

[Add a paragraph break if it is needed.]
A last every turn rule:
	[say "Break required ended up being [break-required].";]
	if break-required is true:
		say paragraph break;
		now break-required is false.
		
[Before issuing the response text of announce the score rule response (D):
	if break-required is true:
		say paragraph break;
		now break-required is false.]
		
The standard report switching off rule is not listed in the report switching off rulebook.

Chapter 2 - Content

Section 1 - Scenes

[Automatically calculate the maximum score as being:
	
	(number of victims x 3) + 1
	
The additional point is for the easter egg. The player is then moved to a random location (other than the stairs, which should not be accessible).]
When play begins:
	let N be the number of asleep victims multiplied by 3;
	increment N;
	now the maximum score is N;
	now the right hand status line is "Score: [score] / [maximum score]";
	say "[italic type]Thursday night. Thursday, a concept that means very little to the recently deceased, which [we] most certainly [regarding the player][are]; and night, which as it turns out, is quickly becoming [our] favourite part of whole night-day dichotomy.[paragraph break]Haunting is on the cards for this particular evening. The supernatural, as it happens, is perfectly natural - common even. [We]['ve] chosen a typical suburban house inhabited by a small family for the occasion. [Our] aim - confuse them, creep them out and scare them silly![paragraph break][We]['re] still new to this whole possession malarky, but an undead buddy of [ours] has kindly agreed to come along to offer pointers here and there. He said he'd meet you there.[roman type][paragraph break][bold type]Hint: [roman type]To possess an item, try [']>[fixed letter spacing]haunt the window[variable letter spacing]['] or [']>[fixed letter spacing]haunt the lamp[variable letter spacing]['].[paragraph break]";
	move the player to the Landing, without printing a room description.

[A very simple scene set-up.]
Sound Asleep is a scene. Sound asleep begins when every victim is asleep. Sound Asleep ends when a victim is not asleep.

Finding Teddy is a scene. Finding Teddy begins when play begins. Finding Teddy ends when the teddy bear is discovered.

When Finding Teddy ends:
	say "'Psst! It's me' hisses your plush companion.".

Paranormal Activity is a scene. Paranormal Activity begins when Sound Asleep ends. Paranormal Activity ends when every victim is scared.

Run to Mommy is a scene. Run to Mommy begins when the young boy is scared. Run to Mommy ends when the young boy is enclosed by the king-sized bed.

When Run to Mommy begins:
	now the quarters of the young boy is the king-sized bed;
	now break-required is false;
	try the young boy exiting.

[End the story when everyone is scared.]
When Paranormal Activity ends:
	end the story finally saying "[italic type]After scaring the poor family half to death, [we] decide to return to the ether before [we] do any serious damage.[paragraph break]What a night! Maybe this being dead business isn't as dull as [we][']d initially suspected. As you shimmer outside preparing to leave, the teddy bear catches you up. 'Personally, I'd give you [grade].' he comments, only half-jokingly. [assessment]!".

[A table and some tokens to quantify and report the score at the end.]
Table of Grades
total	grade	comment
10	"an A+"	"'What a haunt! I could probably learn a few things from you' is his final verdict. Double high fives"
9	"an A"	"'That was some quality scaring! I really like how you haunt.' he tells [us] 'Let[']s do this again some time!' High five"
8	"an A-"	"'What a haunt! You[']re gonna fit in just fine!' he says encouragingly. Way to go"
7	"a B"	"'I think you[']re really starting to get the hang of haunting.' he says encouragingly. 'You just need to take things a little more gradually.' Great job"
6	"a C"	"'That was good fun! I like how you work, but there are a few things I can show you. You just need to take a bit more time with it.' he suggests. Good work"

to say grade:
	if there is a grade corresponding to a total of score in the Table of Grades:
		say "[grade corresponding to a total of score in the Table of Grades]";
		
to say assessment:
	if there is a comment corresponding to a total of score in the Table of Grades:
		say "[comment corresponding to a total of score in the Table of Grades]";
	
Section 2 - World

[The Child's Bedroom]
The Child's Bedroom is a room. The description of it is "A typical kid's bedroom - all bright colours and optimism. [We][']d spit if [we] could. [A small window] paints a daunting trapezoid of moonlight over [if the player can see the young boy]the young boy[otherwise]the child's bed[end if]. There is [a wooden door] leading out.". The child's bed is a bunk in the Child's Bedroom. The young boy is a male victim. The quarters of the young boy is the child's bed. The young boy is in the child's bed. The teddy bear is a toy in the Child's bedroom. A lamp, a closet and a small window are in the child's bedroom.

The description of the teddy bear is "A more experienced buddy of [ours], who kindly offered to come along and help [us] on [our] first haunt. He's [if active][one of]looking intently at his paws[or]waiting to see what [we][']ll do next[or]busy standing on one leg[at random][otherwise]currently playing dead to avoid suspicion[end if].".

The lamp is an illuminator.
The small window is a window.
The closet is an openable fixed in place closed container. The clothes and the jack-in-box are in the closet.

[Things in the closet]
The clothes are plural-named. Haunting the clothes is scary behavior. The weirdness of the clothes is "[if the clothes are contained by the closet]The clothes fly out of the closet in all directions[otherwise]The clothes circle the room as though locked in a ghastly dance before promptly falling back to the floor[end if].". Understand "scattered clothes" as the clothes when the printed name of the clothes is "scattered clothes".
The jack-in-box can be sprung or unsprung. The jack-in-box is unsprung. Haunting the jack-in-box is scary behavior. The weirdness of the jack-in-box is "[if the jack-in-box is unsprung]The little handle on the side of the jack-in-box starts to wind ever so slowly... all of a sudden the jack-in-box springs to life with a laugh so spiteful, [we] wonder why anyone would've chosen it for a children's toy[otherwise]The jack-in-box starts to bend in all directions, laughing in that deliciously hideous way you've come to appreciate[end if].".

The wooden door is an openable closed door. The wooden door is outside from the Child's Bedroom and inside from the Landing.

[The Landing]
The Landing is a room. The description of it is "A [framed family photo] hangs on the wall. [first time]'The illusion of permanence' [we] think to [ourselves]. [only]A [wooden door] leads[if the Child's Bedroom is visited] back[end if] in to the child's bedroom. The hallway itself continues south from here and while there is a staircase leading down to the first floor, all the fun[first time] (read horror)[only] is up here.". The Stairs are down from the Landing. Instead of going to the Stairs, say "There's nobody down there to scare - [the teddy bear] already checked.". A ball and a framed family photo are in the Landing.

Haunting the ball is creepy behavior. The weirdness of the ball is "The ball spontaneously rolls off [if the ball is in the Landing]down the Hallway[otherwise]towards the Landing[end if].".

The framed family photo is fixed in place. Haunting the family photo is creepy behavior. The description of the family photo is "A tacky portrait of the family [we]['][if Sound Asleep is happening]re about to terrorise[otherwise]ve been terrorising[end if].". The weirdness of the family photo is "One by one, the individual eyes of each family member are poked out as if by an invisible pencil. As they lose their eyes, the expression on their face takes on a particularly uncanny smile.[paragraph break]The very moment this grotesque work of performance art comes to a finish, the photo returns to its usual state of tackiness.".

[The Hallway]
The Hallway is a room. The description of it is "[A mirror] hangs on the wall here.[first time] 'How incredibly vain the living are' [we] ponder for a few moments.[only] [A bedroom door] leads[if the Master Bedroom is visited] back[end if] in to the master bedroom. The landing lies to the north.". The Hallway is south of the Landing. A mirror and a pedestal are in the Hallway.

The pedestal is a fixed in place supporter. The radio is a device. It is on the pedestal.
Haunting the radio is loud behavior. The weirdness of the radio is "The radio [if switched off]switches itself on and begins to cycle[otherwise]gives off a loud whine of interference and the continues cycling[end if] through channels seemingly at random.".

The mirror is fixed in place. Haunting the mirror is scary behavior. The weirdness of the mirror is "[if the mirror can be seen by a victim]The mirror perverts the reflection of [the random victim which can see the mirror] into a hideous caricature[otherwise][one of](Easter Egg) The mirror displays the Windows ME logo. Just the thought is enough to make even a poltergeist shiver[or]The mirror displays a rolling landscape of faces, each wrought in its own particular kind of suffering[stopping][end if].".

[An easter egg for haunting the mirror when nobody is nearby. It will only trigger once and will award the player a point for discovering it.]
After haunting the mirror when the location of the player does not enclose a victim for the first time:
	increment the score;
	continue the action.

The bedroom door is an openable closed door. The bedroom door is outside from the Master Bedroom and inside from the Hallway.

[The Master Bedroom]
The Master Bedroom is a room. The description of it is "Moonlight shines in through [the large window][if the player can see the bearded man and the player can see the young woman], the frame's shadow visually segmenting the man and woman as though silently commenting on the state of their marriage[end if]. [A bedroom door] leads[if the Hallway is visited] back[end if] out to the hallway. ". The king-sized bed is a bunk in the Master Bedroom. The bearded man and the young woman are victims. The bearded man is male. The young woman is female. The quarters of the bearded man is the king-sized bed. The quarters of the young woman is the king-sized bed. The bearded man and the young woman are in the king-sized bed. The TV, a bed-side table and a large window are in the Master Bedroom.

The large window is a window.
The TV is a fixed in place device. Haunting the TV is scary behavior. The weirdness of the TV is "The TV switches itself on and begins to cycle through channels seemingly at random.".
The table is a fixed in place supporter. The alarm clock and the flashlight are on the table.

The alarm clock is a device. Haunting the alarm clock is loud behavior. The weirdness of the alarm clock is "[if the alarm clock is switched off]The alarm clock suddenly starts to sound[otherwise]The alarm clock distorts itself into a shriek resembling some kind of alien siren[end if].".
The flashlight is an illuminator.