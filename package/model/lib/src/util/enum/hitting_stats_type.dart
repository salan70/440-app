enum StatsType {
  team,
  games,
  plateAppearances,
  atBats,
  runs,
  hits,
  doubles,
  triples,
  homeRuns,
  totalBases,
  runsBattedIn,
  stolenBases,
  caughtStealing,
  sacrificeHits,
  sacrificeFlies,
  walks,
  intentionalWalks,
  hitByPitch,
  strikeouts,
  groundedIntoDoublePlays,
  battingAverage,
  onBasePercentage,
  sluggingPercentage,
  onBasePlusSlugging,
  extraBaseHits,
  battingAverageOnBallsInPlay,
  isolatedPower,
  atBatsPerHomeRun,
  walkToStrikeoutRatio,
  walkPercentage,
  strikeoutPercentage;

  static StatsType fromString(String value) {
    return StatsType.values
        .firstWhere((element) => element.displayLabel == value);
  }

  String get displayLabel {
    switch (this) {
      case StatsType.team:
        return 'team';
      case StatsType.games:
        return 'G';
      case StatsType.plateAppearances:
        return 'PA';
      case StatsType.atBats:
        return 'AB';
      case StatsType.runs:
        return 'R';
      case StatsType.hits:
        return 'H';
      case StatsType.doubles:
        return '2B';
      case StatsType.triples:
        return '3B';
      case StatsType.homeRuns:
        return 'HR';
      case StatsType.totalBases:
        return 'TB';
      case StatsType.runsBattedIn:
        return 'RBI';
      case StatsType.stolenBases:
        return 'SB';
      case StatsType.caughtStealing:
        return 'CS';
      case StatsType.sacrificeHits:
        return 'SAC';
      case StatsType.sacrificeFlies:
        return 'SF';
      case StatsType.walks:
        return 'BB';
      case StatsType.intentionalWalks:
        return 'IBB';
      case StatsType.hitByPitch:
        return 'HBP';
      case StatsType.strikeouts:
        return 'SO';
      case StatsType.groundedIntoDoublePlays:
        return 'GIDP';
      case StatsType.battingAverage:
        return 'AVG';
      case StatsType.onBasePercentage:
        return 'OBP';
      case StatsType.sluggingPercentage:
        return 'SLG';
      case StatsType.onBasePlusSlugging:
        return 'OPS';
      case StatsType.extraBaseHits:
        return 'XBH';
      case StatsType.battingAverageOnBallsInPlay:
        return 'BABIP';
      case StatsType.isolatedPower:
        return 'ISO';
      case StatsType.atBatsPerHomeRun:
        return 'AB/HR';
      case StatsType.walkToStrikeoutRatio:
        return 'BB/K';
      case StatsType.walkPercentage:
        return 'BB%';
      case StatsType.strikeoutPercentage:
        return 'SO%';
    }
  }
}

enum ResultRank {
  ss,
  s,
  a,
  b,
  c,

  /// 不正解
  incorrect;

  String get label {
    switch (this) {
      case ResultRank.ss:
        return 'SS';
      case ResultRank.s:
        return 'S';
      case ResultRank.a:
        return 'A';
      case ResultRank.b:
        return 'B';
      case ResultRank.c:
        return 'C';
      case ResultRank.incorrect:
        return '不正解';
    }
  }
}

// TODO(me): フォントサイズのconstはそれ用のファイルにまとめたい
// ランクラベルのフォントサイズ
const smallLabelFontSize = 24.0;
const largeLabelFontSize = 40.0;

const statsTypeList = StatsType.values;

/// 確率系のStatsTypeのリスト
final List<String> probabilityStats = [
  StatsType.battingAverage.displayLabel,
  StatsType.onBasePercentage.displayLabel,
  StatsType.sluggingPercentage.displayLabel,
  StatsType.onBasePlusSlugging.displayLabel,
  StatsType.battingAverageOnBallsInPlay.displayLabel,
  StatsType.isolatedPower.displayLabel,
  StatsType.walkPercentage.displayLabel,
  StatsType.strikeoutPercentage.displayLabel,
];
