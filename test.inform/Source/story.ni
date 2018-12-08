"test" by "B David Paulsen"

Mood is a kind of value. The moods are calm, angry, happy, and sad.
A person has a mood.

King Edward is a man. King Edward is in the Throne Room. King Edward is calm. The description of king Edward is "King Edward stands here, looking [synonym-text of King Edward]."

The synonym-text rules are an object based rulebook with default success.
A synonym-text rule for King Edward when the mood of King Edward is sad:
	say "[one of]sad[or]doleful[or]morose[or]dejected[at random]".
A synonym-text rule for King Edward when the mood of King Edward is calm:
	say "[one of]calm[or]unruffled[or]relaxed[or]unphased[at random]".
A synonym-text rule for King Edward when the mood of King Edward is happy:
	say "[one of]happy[or]joyous[or]beatific[or]pleased[at random]".
A synonym-text rule for King Edward when the mood of King Edward is angry:
	say "[one of]angry[or]furious[or]incensed[or]steamed[at random]".

To say synonym-text of (x - a person):
	follow the synonym-text rules for the x.



A gift is a kind of thing. A rose, a skull, and a dagger are gifts held by the player.

The block giving rule does nothing when the noun is a gift.
To say ed-mood (x - a mood):
	now the mood of King Edward is the x.

After giving the rose to King Edward, say "The king accepts the rose with a bashful smile[ed-mood happy]."
After giving the skull to King Edward, say "The king takes the skull and looks at it mournfully. 'Alas,' he murmurs[ed-mood sad].".
After giving the dagger to King Edward, say "The king's face darkens with anger. 'Is this a dagger that I see before me?[ed-mood angry]'".


The Throne Room is a room.