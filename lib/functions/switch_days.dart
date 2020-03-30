class Switcher {
  int currentIndex;
  int lastIndex;

  Switcher({
    this.lastIndex,
    this.currentIndex,
  });

  switchTo(int index) {
    this.lastIndex = currentIndex;
    this.currentIndex = index;
  }
}

Switcher dateSwitcher = Switcher(lastIndex: 0, currentIndex: 0);
