
sealed class WelcomeScreenStateAndEffect{}

//States

sealed class WelcomeScreenState extends WelcomeScreenStateAndEffect{}
class WelcomeScreenProcessingState extends WelcomeScreenState{}
class WelcomeScreenErrorState extends WelcomeScreenState{}


//Effects
sealed class WelcomeScreenEffect extends WelcomeScreenStateAndEffect{}

class WelcomeScreenNavigateEffect extends WelcomeScreenEffect{
  final String path;

  WelcomeScreenNavigateEffect(
      this.path,
  );
}