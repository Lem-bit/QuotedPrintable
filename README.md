# Example

```pascal
var data: String;
...
data:= TQuotedPrintable.Encode('Convert text to Quoted-Printable')

//data  =43=6F=6E=76=65=72=74=20=74=65=78=74=20=74=6F=20=51=75=6F=74=65=64=2D=50=72=69=6E=74=61=62=6C=65

data:= TQuotedPrintable.Decode('=43=6F=6E=76=65=72=74=20=74=65=78=74=20=74=6F=20=51=75=6F=74=65=64=2D=50=72=69=6E=74=61=62=6C=65')

//data = Convert text to Quoted-Printable
