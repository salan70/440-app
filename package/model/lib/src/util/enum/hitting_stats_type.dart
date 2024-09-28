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

  static StatsType fromString(String value) =>
      StatsType.values.firstWhere((element) => element.label == value);

  String get label {
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

  /// %表記するかどうか。
  bool get isPercentage {
    final percentageStatsList = [
      StatsType.walkPercentage,
      StatsType.strikeoutPercentage,
    ];

    return percentageStatsList.contains(this);
  }

  /// .XXX や Y.XXX のように表記するかどうか。
  /// ※ Y が 0 の場合、 .XXX のように 0 を表記しない。
  bool get isDecimal {
    final decimalStatsList = [
      StatsType.battingAverage,
      StatsType.onBasePercentage,
      StatsType.sluggingPercentage,
      StatsType.onBasePlusSlugging,
      StatsType.battingAverageOnBallsInPlay,
      StatsType.isolatedPower,
      StatsType.atBatsPerHomeRun,
    ];

    return decimalStatsList.contains(this);
  }

  /// Y.XXX のように表記するかどうか。
  /// ※ Y が 0 の場合、 0.XXX のように 0 を表記する。
  bool get isDecimalWithZero {
    final decimalWithZeroStatsList = [
      StatsType.walkToStrikeoutRatio,
    ];

    return decimalWithZeroStatsList.contains(this);
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
  StatsType.battingAverage.label,
  StatsType.onBasePercentage.label,
  StatsType.sluggingPercentage.label,
  StatsType.onBasePlusSlugging.label,
  StatsType.battingAverageOnBallsInPlay.label,
  StatsType.isolatedPower.label,
  StatsType.walkPercentage.label,
  StatsType.strikeoutPercentage.label,
];
