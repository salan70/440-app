import '../../../util/enum/hitting_stats_type.dart';
import '../domain/search_condition.dart';

final defaultSearchCondition = SearchCondition(
  teamList: [
    'LAN',
  ],
  minGames: 0,
  minHits: 0,
  minHr: 0,
  selectedStatsList: [
    StatsType.strikeoutPercentage.label,
    StatsType.battingAverage.label,
    StatsType.homeRuns.label,
    StatsType.atBatsPerHomeRun.label,
  ],
);

// NPBの球団リスト
const npbTeamList = <Map<String, String>>[
  {'name': 'LAN', 'league': 'パ・リーグ'},
  {'name': '福岡ソフトバンクホークス', 'league': 'パ・リーグ'},
  {'name': '埼玉西武ライオンズ', 'league': 'パ・リーグ'},
  {'name': '東北楽天ゴールデンイーグルス', 'league': 'パ・リーグ'},
  {'name': '千葉ロッテマリーンズ', 'league': 'パ・リーグ'},
  {'name': '北海道日本ハムファイターズ', 'league': 'パ・リーグ'},
  {'name': '東京ヤクルトスワローズ', 'league': 'セ・リーグ'},
  {'name': '横浜DeNAベイスターズ', 'league': 'セ・リーグ'},
  {'name': '阪神タイガース', 'league': 'セ・リーグ'},
  {'name': '読売ジャイアンツ', 'league': 'セ・リーグ'},
  {'name': '広島東洋カープ', 'league': 'セ・リーグ'},
  {'name': '中日ドラゴンズ', 'league': 'セ・リーグ'},
];

/// 出題する成績の選択数
///
/// この数ちょうどでなくてはならない
const mustSelectStatsNum = 4;

const minChoseTeamNum = 1;

const minGamesOptionList = [0, 100, 300, 500, 1000];

const minHitsOptionList = [0, 100, 300, 500, 1000];

const minHrOptionList = [0, 10, 50, 100, 200];
