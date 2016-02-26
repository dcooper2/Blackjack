
# Blackjack Program
#use strict;
#use warnings;


# hashtable containing card values
@cards = ('2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace');
@cardValues = (2,3,4,5,6,7,8,9,10,10,10,10,11,1);
$endGame = "false";

sub randomGen{
	my @cardV = @_;
	my $var; 
	$var = int(rand(13));
	
	return($cards[$var]);
}

sub addCard{
	my @player = @_;
	my @values = @_;

	my $x;
	my $sum = 0;
	my $newCard;
	$x = randomGen();
	$newCard = $cards[$x];

	if ($newCard =~ /Ace/){
		foreach(@values){
			$sum = $sum + $_;			
		}
		if (($sum + 11) < 21){
			push(@player, $newCard);
			push(@values, 11);
		}
		if (($sum + 11) > 21){
			push(@player, $newCard);
			push(@values, 1);
		}
	
	}
	else{
		push(@player, $newCard);
		push(@values, $cardValues[$x]);
	}
	return @player;
}

sub addValue{
	my $x = $_;
	my @values = @_;
	
	push(@values, $cardValues[$x]);
	return @values;
}


until ($endGame =~ /true/){
$endRound = "false";


print "~~~~~~~~~~~~~Welcome to BlackJack~~~~~~~~~~~~~~~~\n\n\n";
my $var = randomGen();
my $var2 = randomGen();
my @playersCards = ($cards[$var], $cards[$var2]);
my @cardNums = ($cardValues[$var], $cardValues[$var2]);
print "Your cards:\nSuit:  @playersCards\nNumber: @cardNums\n";
#print "Your cards: @playersCards\n";
print "You have no cards!" unless @playersCards;

	while ($endRound =~ /false/){
		print "Do you want to hit? (yes or no)\n";
		$input = <STDIN>;
		my $cardSum = 0;
		if ($input =~ /no|n|NO/){
			foreach (@playersCards){
				$cardSum = $cardSum + $_;
			}
			if ($cardSum < 21){
				print "Card Sum: $cardSum\n";
				print "Bust! You're under 21! Better luck next time :/\n";
			}
			if ($cardSum > 21){
				print "Card Sum: $cardSum\n";
				print "Bust! You're over 21!  Better luck next time :/\n";
			}
			if ($cardSum == 21){
				print "Card Sum: $cardSum\n";
				print "Blackjack!!! Congrats!\n";
			}
			$endRound = "true";
		}
		if ($input =~ /yes|YES|y/){
			#my @newA =  addCard(@playersCards, @cardNums);	
			#splice(@playersCards, @newA);
			my $newCard = randomGen();
			#push(@playersCards, $cards[$newCard]);
			#push(@cardNums, $cardValues[$newCard]);

			if ($cards[$newCard] =~ /Ace/){
	                foreach(@cardNums){
        	                $cardSum = $cardSum + $_;
                	}
                	if (($cardSum + 11) < 21){
                        	push(@playersCards, $cards[$newCard]);
                        	push(@cardNums, 11);
                	}
                	if (($cardSum + 11) > 21){
                	        push(@playersCards, $cards[$newCard]);
                        	push(@cardNums, 1);
                	}

        		}
        		else{
       	 	        	push(@playersCards, $cards[$newCard]);
                		push(@cardNums, $cardValues[$newCard]);
        		}
			
			print "Your cards:\nSuit:  @playersCards\nNumber: @cardNums\n";
			

			$endRound = "false";
		}
	}

	print "Would you like to play again?\n";
                        $input2 = <STDIN>;
                        if ($input2 =~ /yes|y|YES/){
                                $endGame = "false";
                        }
                        if ($input2 =~ /no|NO|n/){
                                $endGame = "true";
                                last;
                        }
	
 }

