<<<<<<< HEAD
//weapons affect the strength stat
public class Weapon extends Item
{
  //instance variables
  private int _statModifier;  //how much it modifies the strength stat by
  private PImage img;
  private int x;
  private int y;

  //Constructor
  public Weapon(String name, int statModifier)
  {
    super(name, "Weapon");
    _statModifier = statModifier;
    x = ((int) random(601)) * 60;
    y = ((int) random(601)) * 60;
  }

  //accessor
  public int getModifier() { 
    return _statModifier;
  }

  //Mutator
  public int setModifier(int newModifier)
  {
    int tmp = _statModifier;
    _statModifier = newModifier;
    return tmp;
  }

  void display()
  {
    img = loadImage("sword.gif");
    image(img, x, y, 60, 60);
  }
}
=======
//weapons affect the strength stat
public class Weapon extends Item
{
  //instance variables
  private int _statModifier;  //how much it modifies the strength stat by
  private PImage img;
  private int x;
  private int y;

  //Constructor
  public Weapon(String name, int statModifier)
  {
    super(name, "Weapon");
    _statModifier = statModifier;
    x = ((int) random(601)/60) * 60;
    y = ((int) random(601)/60) * 60;
  }

  //accessor
  public int getModifier() { 
    return _statModifier;
  }

  //Mutator
  public int setModifier(int newModifier)
  {
    int tmp = _statModifier;
    _statModifier = newModifier;
    return tmp;
  }

  void display()
  {
    img = loadImage("sword.png");
    image(img, x, y, 60, 60);
    println("DISPLAYING SWORD");
  }
}
>>>>>>> 8bb9ccecaf6303f6b0208ae285be1deaf49746de
There have been several claims for the longest sentence in the English language, usually with claims that revolve around the longest printed sentence, because there is no limit on the possible length of a written English sentence.

At least one linguistics textbook concludes that, in theory, "there is no longest English sentence".[1] A sentence can be made arbitrarily long by successive iterations, such as Someone thinks that someone thinks that someone thinks that...,[2] or by combining shorter clauses in various ways.

For example, sentences can be extended by recursively embedding clauses one into another, such as [3][4]

The mouse ran away
The mouse that the cat bit ran away
...
The mouse that the cat that the dog that the man frightened chased bit ran away
The ability to embed structures within larger ones is called recursion.[5] This also highlights the difference between linguistic performance and linguistic competence, because the language can support more variation than can reasonably be created or recorded.[2]

Exceptionally long sentences in print
One of the longest sentences in literature is contained in William Faulkner's Absalom, Absalom! (1936). The sentence is composed of 1,288 words (In the 1951 Random House version).[6]

Another sentence that is often claimed to be the longest sentence ever written is Molly Bloom's soliloquy in the James Joyce novel Ulysses (1922), which contains a sentence of 3,687 words.[6] However, this sentence is simply many sentences without punctuation.

Jonathan Coe's The Rotters' Club appears to hold the record at 13,955 words.[6] It was inspired by Bohumil Hrabal's Dancing Lessons for the Advanced in Age: a Czech language novel written in one long sentence.

See also
Longest word in English
Longest words
References
 Steven E. Weisler; Slavoljub P. Milekic; Slavko Milekic (2000). Theory of Language. MIT Press. ISBN 0-262-73125-8.
 Stephen Crain; Diane Lillo-Martin (1999). An Introduction to Linguistic Theory and Language Acquisition. Blackwell Publishing. ISBN 0-631-19536-X.
 Morten H Christiansen, Nick Chater, Toward a Connectionist Model of Recursion in Human Linguistic Performance, Cognitive Science, vol. 23, issue 2, 1999, doi:10.1207/s15516709cog2302_2
 Thomas R. Shultz (2003). Computational Developmental Psychology. p. 236.
 Carnie, Andrew (2013). Syntax: A Generative Introduction (third ed.). Singapore: Wiley-Blackwell. p. 33. ISBN 978-0-470-65531-3.
 Jones, Rebecca (3 October 2014). "Longest Sentence". Today. BBC. Retrieved 12 February 2015.
 There have been several claims for the longest sentence in the English language, usually with claims that revolve around the longest printed sentence, because there is no limit on the possible length of a written English sentence.

At least one linguistics textbook concludes that, in theory, "there is no longest English sentence".[1] A sentence can be made arbitrarily long by successive iterations, such as Someone thinks that someone thinks that someone thinks that...,[2] or by combining shorter clauses in various ways.

For example, sentences can be extended by recursively embedding clauses one into another, such as [3][4]

The mouse ran away
The mouse that the cat bit ran away
...
The mouse that the cat that the dog that the man frightened chased bit ran away
The ability to embed structures within larger ones is called recursion.[5] This also highlights the difference between linguistic performance and linguistic competence, because the language can support more variation than can reasonably be created or recorded.[2]

Exceptionally long sentences in print
One of the longest sentences in literature is contained in William Faulkner's Absalom, Absalom! (1936). The sentence is composed of 1,288 words (In the 1951 Random House version).[6]

Another sentence that is often claimed to be the longest sentence ever written is Molly Bloom's soliloquy in the James Joyce novel Ulysses (1922), which contains a sentence of 3,687 words.[6] However, this sentence is simply many sentences without punctuation.

Jonathan Coe's The Rotters' Club appears to hold the record at 13,955 words.[6] It was inspired by Bohumil Hrabal's Dancing Lessons for the Advanced in Age: a Czech language novel written in one long sentence.

See also
Longest word in English
Longest words
References
 Steven E. Weisler; Slavoljub P. Milekic; Slavko Milekic (2000). Theory of Language. MIT Press. ISBN 0-262-73125-8.
 Stephen Crain; Diane Lillo-Martin (1999). An Introduction to Linguistic Theory and Language Acquisition. Blackwell Publishing. ISBN 0-631-19536-X.
 Morten H Christiansen, Nick Chater, Toward a Connectionist Model of Recursion in Human Linguistic Performance, Cognitive Science, vol. 23, issue 2, 1999, doi:10.1207/s15516709cog2302_2
 Thomas R. Shultz (2003). Computational Developmental Psychology. p. 236.
 Carnie, Andrew (2013). Syntax: A Generative Introduction (third ed.). Singapore: Wiley-Blackwell. p. 33. ISBN 978-0-470-65531-3.
 Jones, Rebecca (3 October 2014). "Longest Sentence". Today. BBC. Retrieved 12 February 2015.
 There have been several claims for the longest sentence in the English language, usually with claims that revolve around the longest printed sentence, because there is no limit on the possible length of a written English sentence.

At least one linguistics textbook concludes that, in theory, "there is no longest English sentence".[1] A sentence can be made arbitrarily long by successive iterations, such as Someone thinks that someone thinks that someone thinks that...,[2] or by combining shorter clauses in various ways.

For example, sentences can be extended by recursively embedding clauses one into another, such as [3][4]

The mouse ran away
The mouse that the cat bit ran away
...
The mouse that the cat that the dog that the man frightened chased bit ran away
The ability to embed structures within larger ones is called recursion.[5] This also highlights the difference between linguistic performance and linguistic competence, because the language can support more variation than can reasonably be created or recorded.[2]

Exceptionally long sentences in print
One of the longest sentences in literature is contained in William Faulkner's Absalom, Absalom! (1936). The sentence is composed of 1,288 words (In the 1951 Random House version).[6]

Another sentence that is often claimed to be the longest sentence ever written is Molly Bloom's soliloquy in the James Joyce novel Ulysses (1922), which contains a sentence of 3,687 words.[6] However, this sentence is simply many sentences without punctuation.

Jonathan Coe's The Rotters' Club appears to hold the record at 13,955 words.[6] It was inspired by Bohumil Hrabal's Dancing Lessons for the Advanced in Age: a Czech language novel written in one long sentence.

See also
Longest word in English
Longest words
References
 Steven E. Weisler; Slavoljub P. Milekic; Slavko Milekic (2000). Theory of Language. MIT Press. ISBN 0-262-73125-8.
 Stephen Crain; Diane Lillo-Martin (1999). An Introduction to Linguistic Theory and Language Acquisition. Blackwell Publishing. ISBN 0-631-19536-X.
 Morten H Christiansen, Nick Chater, Toward a Connectionist Model of Recursion in Human Linguistic Performance, Cognitive Science, vol. 23, issue 2, 1999, doi:10.1207/s15516709cog2302_2
 Thomas R. Shultz (2003). Computational Developmental Psychology. p. 236.
 Carnie, Andrew (2013). Syntax: A Generative Introduction (third ed.). Singapore: Wiley-Blackwell. p. 33. ISBN 978-0-470-65531-3.
 Jones, Rebecca (3 October 2014). "Longest Sentence". Today. BBC. Retrieved 12 February 2015.
 There have been several claims for the longest sentence in the English language, usually with claims that revolve around the longest printed sentence, because there is no limit on the possible length of a written English sentence.

At least one linguistics textbook concludes that, in theory, "there is no longest English sentence".[1] A sentence can be made arbitrarily long by successive iterations, such as Someone thinks that someone thinks that someone thinks that...,[2] or by combining shorter clauses in various ways.

For example, sentences can be extended by recursively embedding clauses one into another, such as [3][4]

The mouse ran away
The mouse that the cat bit ran away
...
The mouse that the cat that the dog that the man frightened chased bit ran away
The ability to embed structures within larger ones is called recursion.[5] This also highlights the difference between linguistic performance and linguistic competence, because the language can support more variation than can reasonably be created or recorded.[2]

Exceptionally long sentences in print
One of the longest sentences in literature is contained in William Faulkner's Absalom, Absalom! (1936). The sentence is composed of 1,288 words (In the 1951 Random House version).[6]

Another sentence that is often claimed to be the longest sentence ever written is Molly Bloom's soliloquy in the James Joyce novel Ulysses (1922), which contains a sentence of 3,687 words.[6] However, this sentence is simply many sentences without punctuation.

Jonathan Coe's The Rotters' Club appears to hold the record at 13,955 words.[6] It was inspired by Bohumil Hrabal's Dancing Lessons for the Advanced in Age: a Czech language novel written in one long sentence.

See also
Longest word in English
Longest words
References
 Steven E. Weisler; Slavoljub P. Milekic; Slavko Milekic (2000). Theory of Language. MIT Press. ISBN 0-262-73125-8.
 Stephen Crain; Diane Lillo-Martin (1999). An Introduction to Linguistic Theory and Language Acquisition. Blackwell Publishing. ISBN 0-631-19536-X.
 Morten H Christiansen, Nick Chater, Toward a Connectionist Model of Recursion in Human Linguistic Performance, Cognitive Science, vol. 23, issue 2, 1999, doi:10.1207/s15516709cog2302_2
 Thomas R. Shultz (2003). Computational Developmental Psychology. p. 236.
 Carnie, Andrew (2013). Syntax: A Generative Introduction (third ed.). Singapore: Wiley-Blackwell. p. 33. ISBN 978-0-470-65531-3.
 Jones, Rebecca (3 October 2014). "Longest Sentence". Today. BBC. Retrieved 12 February 2015.
