import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_charts_model.dart';
export 'nav_charts_model.dart';

class NavChartsWidget extends StatefulWidget {
  const NavChartsWidget({super.key});

  static String routeName = 'Nav_Charts';
  static String routePath = '/navCharts';

  @override
  State<NavChartsWidget> createState() => _NavChartsWidgetState();
}

class _NavChartsWidgetState extends State<NavChartsWidget> {
  late NavChartsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavChartsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final chartPieChartColorsList2 = [Color(0xFF4CAF7D), Color(0xFFD36B6B)];
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE6F0E8),
        appBar: AppBar(
          backgroundColor: Color(0xFF2E5E4E),
          automaticallyImplyLeading: false,
          title: Text(
            'Summary',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w800,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: StreamBuilder<List<FolderCreateCollectionRecord>>(
                      stream: queryFolderCreateCollectionRecord(
                        queryBuilder: (folderCreateCollectionRecord) =>
                            folderCreateCollectionRecord.where(
                          'userForeignKEY',
                          isEqualTo: currentUserReference,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<FolderCreateCollectionRecord>
                            dropDownFolderCreateCollectionRecordList =
                            snapshot.data!;

                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= FFAppState().chartOption,
                          ),
                          options: dropDownFolderCreateCollectionRecordList
                              .map((e) => valueOrDefault<String>(
                                    e.folder,
                                    'Uncategorized',
                                  ))
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue = val);
                            _model.dropdownActionFolder =
                                await queryFolderCreateCollectionRecordOnce(
                              queryBuilder: (folderCreateCollectionRecord) =>
                                  folderCreateCollectionRecord
                                      .where(
                                        'folder',
                                        isEqualTo: _model.dropDownValue,
                                      )
                                      .where(
                                        'userForeignKEY',
                                        isEqualTo: currentUserReference,
                                      ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            safeSetState(() {});
                          },
                          width: 200.0,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF282B25),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          hintText: 'Select a Folder',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFF1F4F8),
                          elevation: 2.0,
                          borderColor: Color(0xFF135413),
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 24.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Per Folder',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF282B25),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'Below is an overview of calculations per folder ',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            if (_model.dropDownValue != null &&
                                _model.dropDownValue != '')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 32.0,
                                          constraints: BoxConstraints(
                                            maxHeight: 32.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .radio_button_checked_sharp,
                                                  color: Color(0xFF4CAF7D),
                                                  size: 20.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Revenue',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 32.0,
                                          constraints: BoxConstraints(
                                            maxHeight: 32.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .radio_button_checked_sharp,
                                                  color: Color(0xFFD36B6B),
                                                  size: 20.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Expense',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 32.0,
                                          constraints: BoxConstraints(
                                            maxHeight: 32.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: StreamBuilder<
                                        List<BudgetListCollectionRecord>>(
                                      stream: queryBudgetListCollectionRecord(
                                        queryBuilder:
                                            (budgetListCollectionRecord) =>
                                                budgetListCollectionRecord
                                                    .where(
                                                      'userForeignKEY',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'folderForeignKEY',
                                                      isEqualTo: _model
                                                                      .dropDownValue ==
                                                                  null ||
                                                              _model.dropDownValue ==
                                                                  ''
                                                          ? null
                                                          : _model
                                                              .dropdownActionFolder
                                                              ?.reference,
                                                    )
                                                    .orderBy('date_created'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<BudgetListCollectionRecord>
                                            chartBudgetListCollectionRecordList =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          height: 200.0,
                                          child: FlutterFlowLineChart(
                                            data: [
                                              FFLineChartData(
                                                xData:
                                                    chartBudgetListCollectionRecordList
                                                        .where((e) =>
                                                            e.category ==
                                                            'Expense')
                                                        .toList()
                                                        .map((d) =>
                                                            d.dateCreated)
                                                        .toList(),
                                                yData:
                                                    chartBudgetListCollectionRecordList
                                                        .where((e) =>
                                                            e.category ==
                                                            'Expense')
                                                        .toList()
                                                        .map((d) =>
                                                            d.absoluteAmount)
                                                        .toList(),
                                                settings: LineChartBarData(
                                                  color: Color(0xFFD36B6B),
                                                  barWidth: 2.0,
                                                  belowBarData: BarAreaData(
                                                    show: true,
                                                    color: Color(0x89F4C5C7),
                                                  ),
                                                ),
                                              ),
                                              FFLineChartData(
                                                xData:
                                                    chartBudgetListCollectionRecordList
                                                        .where((e) =>
                                                            e.category ==
                                                            'Revenue')
                                                        .toList()
                                                        .map((d) =>
                                                            d.dateCreated)
                                                        .toList(),
                                                yData:
                                                    chartBudgetListCollectionRecordList
                                                        .where((e) =>
                                                            e.category ==
                                                            'Revenue')
                                                        .toList()
                                                        .map((d) => d.amount)
                                                        .toList(),
                                                settings: LineChartBarData(
                                                  color: Color(0xFF4CAF7D),
                                                  barWidth: 2.0,
                                                  belowBarData: BarAreaData(
                                                    show: true,
                                                    color: Color(0x5C4CAF7D),
                                                  ),
                                                ),
                                              )
                                            ],
                                            chartStylingInfo: ChartStylingInfo(
                                              enableTooltip: true,
                                              backgroundColor: Colors.white,
                                              showGrid: true,
                                              showBorder: false,
                                            ),
                                            axisBounds: AxisBounds(),
                                            xAxisLabelInfo: AxisLabelInfo(
                                              title: 'Per Transaction',
                                              titleTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            yAxisLabelInfo: AxisLabelInfo(
                                              title: 'Revenue & Expenses',
                                              titleTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            if (_model.dropDownValue != null &&
                                _model.dropDownValue != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: StreamBuilder<
                                    List<PieChartCollectionRecord>>(
                                  stream: queryPieChartCollectionRecord(
                                    queryBuilder: (pieChartCollectionRecord) =>
                                        pieChartCollectionRecord
                                            .where(
                                              'userForeignKEY',
                                              isEqualTo: currentUserReference,
                                            )
                                            .where(
                                              'folderForeignKEY',
                                              isEqualTo: _model.dropDownValue ==
                                                          null ||
                                                      _model.dropDownValue == ''
                                                  ? null
                                                  : _model.dropdownActionFolder
                                                      ?.reference,
                                            )
                                            .orderBy('category',
                                                descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PieChartCollectionRecord>
                                        chartPieChartCollectionRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      child: FlutterFlowPieChart(
                                        data: FFPieChartData(
                                          values:
                                              chartPieChartCollectionRecordList
                                                  .map((d) =>
                                                      d.totalAmountsFolder)
                                                  .toList(),
                                          colors: chartPieChartColorsList2,
                                          radius: [100.0],
                                          borderWidth: [0.5],
                                          borderColor: [Colors.black],
                                        ),
                                        donutHoleRadius: 0.0,
                                        donutHoleColor: Colors.white,
                                        sectionLabelType:
                                            PieChartSectionLabelType.percent,
                                        sectionLabelStyle: FlutterFlowTheme.of(
                                                context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                        labelFormatter: LabelFormatter(
                                          numberFormat: (val) => formatNumber(
                                            val,
                                            formatType: FormatType.custom,
                                            format: '###.0#',
                                            locale: '',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (_model.dropDownValue != null &&
                                _model.dropDownValue != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<
                                        List<BudgetListCollectionRecord>>(
                                      stream: queryBudgetListCollectionRecord(
                                        queryBuilder:
                                            (budgetListCollectionRecord) =>
                                                budgetListCollectionRecord
                                                    .where(
                                                      'userForeignKEY',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'folderForeignKEY',
                                                      isEqualTo: _model
                                                                      .dropDownValue ==
                                                                  null ||
                                                              _model.dropDownValue ==
                                                                  ''
                                                          ? null
                                                          : _model
                                                              .dropdownActionFolder
                                                              ?.reference,
                                                    )
                                                    .orderBy('date_created'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<BudgetListCollectionRecord>
                                            listViewBudgetListCollectionRecordList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            12.0,
                                            0,
                                            44.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewBudgetListCollectionRecordList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewBudgetListCollectionRecord =
                                                listViewBudgetListCollectionRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxWidth: 570.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    listViewBudgetListCollectionRecord
                                                                        .title,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF15161E),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                        "M/d/yy",
                                                                        listViewBudgetListCollectionRecord
                                                                            .dateCreated!),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF606A85),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    formatNumber(
                                                                      listViewBudgetListCollectionRecord
                                                                          .amount,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .periodDecimal,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF606A85),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 2.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Text(
                                                'Total',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF15161E),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: StreamBuilder<
                                                        List<
                                                            BudgetListCollectionRecord>>(
                                                      stream:
                                                          queryBudgetListCollectionRecord(
                                                        queryBuilder:
                                                            (budgetListCollectionRecord) =>
                                                                budgetListCollectionRecord
                                                                    .where(
                                                                      'userForeignKEY',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          'Revenue',
                                                                    )
                                                                    .where(
                                                                      'folderForeignKEY',
                                                                      isEqualTo: _model.dropDownValue == null ||
                                                                              _model.dropDownValue ==
                                                                                  ''
                                                                          ? null
                                                                          : _model
                                                                              .dropdownActionFolder
                                                                              ?.reference,
                                                                    ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BudgetListCollectionRecord>
                                                            containerBudgetListCollectionRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                (List<double>
                                                                    profitTotal) {
                                                                  return profitTotal
                                                                          .isEmpty
                                                                      ? 0.0
                                                                      : profitTotal.reduce((value,
                                                                              element) =>
                                                                          value +
                                                                          element);
                                                                }(containerBudgetListCollectionRecordList
                                                                    .map((e) =>
                                                                        e.amount)
                                                                    .toList()),
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .periodDecimal,
                                                              ),
                                                              '0.00',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .plusJakartaSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF4CAF7D),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: StreamBuilder<
                                                        List<
                                                            BudgetListCollectionRecord>>(
                                                      stream:
                                                          queryBudgetListCollectionRecord(
                                                        queryBuilder:
                                                            (budgetListCollectionRecord) =>
                                                                budgetListCollectionRecord
                                                                    .where(
                                                                      'userForeignKEY',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'category',
                                                                      isEqualTo:
                                                                          'Expense',
                                                                    )
                                                                    .where(
                                                                      'folderForeignKEY',
                                                                      isEqualTo: _model.dropDownValue == null ||
                                                                              _model.dropDownValue ==
                                                                                  ''
                                                                          ? null
                                                                          : _model
                                                                              .dropdownActionFolder
                                                                              ?.reference,
                                                                    ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BudgetListCollectionRecord>
                                                            containerBudgetListCollectionRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                (List<double>
                                                                    profitTotal) {
                                                                  return profitTotal
                                                                          .isEmpty
                                                                      ? 0.0
                                                                      : profitTotal.reduce((value,
                                                                              element) =>
                                                                          value +
                                                                          element);
                                                                }(containerBudgetListCollectionRecordList
                                                                    .map((e) =>
                                                                        e.amount)
                                                                    .toList()),
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .periodDecimal,
                                                              ),
                                                              '0.00',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .plusJakartaSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFFD36B6B),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: StreamBuilder<
                                                        List<
                                                            BudgetListCollectionRecord>>(
                                                      stream:
                                                          queryBudgetListCollectionRecord(
                                                        queryBuilder:
                                                            (budgetListCollectionRecord) =>
                                                                budgetListCollectionRecord
                                                                    .where(
                                                                      'userForeignKEY',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'folderForeignKEY',
                                                                      isEqualTo: _model.dropDownValue == null ||
                                                                              _model.dropDownValue ==
                                                                                  ''
                                                                          ? null
                                                                          : _model
                                                                              .dropdownActionFolder
                                                                              ?.reference,
                                                                    ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BudgetListCollectionRecord>
                                                            containerBudgetListCollectionRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                (List<double>
                                                                    profitTotal) {
                                                                  return profitTotal
                                                                          .isEmpty
                                                                      ? 0.0
                                                                      : profitTotal.reduce((value,
                                                                              element) =>
                                                                          value +
                                                                          element);
                                                                }(containerBudgetListCollectionRecordList
                                                                    .map((e) =>
                                                                        e.amount)
                                                                    .toList()),
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .periodDecimal,
                                                              ),
                                                              '0.00',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .plusJakartaSans(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF3FA6A0),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 2.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  StreamBuilder<List<FolderCreateCollectionRecord>>(
                    stream: queryFolderCreateCollectionRecord(
                      queryBuilder: (folderCreateCollectionRecord) =>
                          folderCreateCollectionRecord.where(
                        'userForeignKEY',
                        isEqualTo: currentUserReference,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<FolderCreateCollectionRecord>
                          dropDownYearFolderCreateCollectionRecordList =
                          snapshot.data!;

                      return FlutterFlowDropDown<String>(
                        controller: _model.dropDownYearValueController ??=
                            FormFieldController<String>(null),
                        options: (List<String> stringList) {
                          return (stringList ?? []).toSet().toList()
                            ..sort(
                                (a, b) => int.parse(a).compareTo(int.parse(b)));
                        }(dropDownYearFolderCreateCollectionRecordList
                            .map((e) => valueOrDefault<String>(
                                  e.yearCreated,
                                  'Uncategorized',
                                ))
                            .toList()),
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownYearValue = val),
                        width: 200.0,
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF282B25),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        hintText: 'Select a Year',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: Color(0xFFF1F4F8),
                        elevation: 2.0,
                        borderColor: Color(0xFF135413),
                        borderWidth: 2.0,
                        borderRadius: 12.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 24.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'Per Year',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF282B25),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 0.0, 0.0),
                              child: Text(
                                'Below is a summary  overview of yearly calculations',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            if (_model.dropDownYearValue != null &&
                                _model.dropDownYearValue != '')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: StreamBuilder<
                                        List<FolderCreateCollectionRecord>>(
                                      stream: queryFolderCreateCollectionRecord(
                                        queryBuilder:
                                            (folderCreateCollectionRecord) =>
                                                folderCreateCollectionRecord
                                                    .where(
                                                      'userForeignKEY',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'yearCreated',
                                                      isEqualTo: _model
                                                          .dropDownYearValue,
                                                    )
                                                    .orderBy('dateCreated'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<FolderCreateCollectionRecord>
                                            chartFolderCreateCollectionRecordList =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          height: 200.0,
                                          child: FlutterFlowLineChart(
                                            data: [
                                              FFLineChartData(
                                                xData:
                                                    chartFolderCreateCollectionRecordList
                                                        .map((d) =>
                                                            d.dateCreated)
                                                        .toList(),
                                                yData:
                                                    chartFolderCreateCollectionRecordList
                                                        .map((d) => d.netTotal)
                                                        .toList(),
                                                settings: LineChartBarData(
                                                  color: Color(0xFF3FA6A0),
                                                  barWidth: 2.0,
                                                  belowBarData: BarAreaData(
                                                    show: true,
                                                    color: Color(0x713FA6A0),
                                                  ),
                                                ),
                                              )
                                            ],
                                            chartStylingInfo: ChartStylingInfo(
                                              enableTooltip: true,
                                              backgroundColor: Colors.white,
                                              showGrid: true,
                                              showBorder: false,
                                            ),
                                            axisBounds: AxisBounds(),
                                            xAxisLabelInfo: AxisLabelInfo(),
                                            yAxisLabelInfo: AxisLabelInfo(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 12.0, 5.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF7FAF8),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0xFFE5E7EB),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 6.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                'Folder',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF606A85),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Income',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF606A85),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Expenses',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF606A85),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'NET',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF606A85),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  StreamBuilder<
                                      List<FolderCreateCollectionRecord>>(
                                    stream: queryFolderCreateCollectionRecord(
                                      queryBuilder:
                                          (folderCreateCollectionRecord) =>
                                              folderCreateCollectionRecord
                                                  .where(
                                                    'userForeignKEY',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'yearCreated',
                                                    isEqualTo: _model
                                                        .dropDownYearValue,
                                                  ),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<FolderCreateCollectionRecord>
                                          columnFolderCreateCollectionRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final columnFolderCreateCollectionRecord =
                                          columnFolderCreateCollectionRecordList
                                                  .isNotEmpty
                                              ? columnFolderCreateCollectionRecordList
                                                  .first
                                              : null;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  columnFolderCreateCollectionRecord!
                                                      .yearCreated,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              StreamBuilder<
                                                  List<
                                                      FolderCreateCollectionRecord>>(
                                                stream:
                                                    queryFolderCreateCollectionRecord(
                                                  queryBuilder:
                                                      (folderCreateCollectionRecord) =>
                                                          folderCreateCollectionRecord
                                                              .where(
                                                                'userForeignKEY',
                                                                isEqualTo:
                                                                    currentUserReference,
                                                              )
                                                              .where(
                                                                'yearCreated',
                                                                isEqualTo: _model
                                                                    .dropDownYearValue,
                                                              )
                                                              .orderBy(
                                                                  'dateCreated'),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<FolderCreateCollectionRecord>
                                                      listViewFolderCreateCollectionRecordList =
                                                      snapshot.data!;

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      12.0,
                                                      0,
                                                      44.0,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewFolderCreateCollectionRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 12.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewFolderCreateCollectionRecord =
                                                          listViewFolderCreateCollectionRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 570.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              listViewFolderCreateCollectionRecord.folder,
                                                                              style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                    font: GoogleFonts.outfit(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF15161E),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                  ),
                                                                              overflow: TextOverflow.fade,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  listViewFolderCreateCollectionRecord.revenueTotal,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                                '0.00',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF606A85),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  listViewFolderCreateCollectionRecord.expenseTotal,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                                '0.00',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF606A85),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  listViewFolderCreateCollectionRecord.netTotal,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                                '0.00',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF606A85),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 2.0)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 570.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: Text(
                                                          'Total',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF15161E),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: StreamBuilder<
                                                                  List<
                                                                      BudgetListCollectionRecord>>(
                                                                stream:
                                                                    queryBudgetListCollectionRecord(
                                                                  queryBuilder: (budgetListCollectionRecord) =>
                                                                      budgetListCollectionRecord
                                                                          .where(
                                                                            'userForeignKEY',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'category',
                                                                            isEqualTo:
                                                                                'Revenue',
                                                                          )
                                                                          .where(
                                                                            'folderCreatedYEAR',
                                                                            isEqualTo:
                                                                                _model.dropDownYearValue,
                                                                          ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<BudgetListCollectionRecord>
                                                                      containerBudgetListCollectionRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                    ),
                                                                    child:
                                                                        AutoSizeText(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          (List<double>
                                                                              profitTotal) {
                                                                            return profitTotal.isEmpty
                                                                                ? 0.0
                                                                                : profitTotal.reduce((value, element) => value + element);
                                                                          }(containerBudgetListCollectionRecordList
                                                                              .map((e) => e.amount)
                                                                              .toList()),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        ),
                                                                        '1,000,000.00',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.plusJakartaSans(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF4CAF7D),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: StreamBuilder<
                                                                  List<
                                                                      BudgetListCollectionRecord>>(
                                                                stream:
                                                                    queryBudgetListCollectionRecord(
                                                                  queryBuilder: (budgetListCollectionRecord) =>
                                                                      budgetListCollectionRecord
                                                                          .where(
                                                                            'userForeignKEY',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'category',
                                                                            isEqualTo:
                                                                                'Expense',
                                                                          )
                                                                          .where(
                                                                            'folderCreatedYEAR',
                                                                            isEqualTo:
                                                                                _model.dropDownYearValue,
                                                                          ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<BudgetListCollectionRecord>
                                                                      containerBudgetListCollectionRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          (List<double>
                                                                              profitTotal) {
                                                                            return profitTotal.isEmpty
                                                                                ? 0.0
                                                                                : profitTotal.reduce((value, element) => value + element);
                                                                          }(containerBudgetListCollectionRecordList
                                                                              .map((e) => e.amount)
                                                                              .toList()),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        ),
                                                                        '1,000,000.00',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.plusJakartaSans(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFFD36B6B),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: StreamBuilder<
                                                                  List<
                                                                      BudgetListCollectionRecord>>(
                                                                stream:
                                                                    queryBudgetListCollectionRecord(
                                                                  queryBuilder: (budgetListCollectionRecord) =>
                                                                      budgetListCollectionRecord
                                                                          .where(
                                                                            'userForeignKEY',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'folderCreatedYEAR',
                                                                            isEqualTo:
                                                                                _model.dropDownYearValue,
                                                                          ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<BudgetListCollectionRecord>
                                                                      containerBudgetListCollectionRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          (List<double>
                                                                              profitTotal) {
                                                                            return profitTotal.isEmpty
                                                                                ? 0.0
                                                                                : profitTotal.reduce((value, element) => value + element);
                                                                          }(containerBudgetListCollectionRecordList
                                                                              .map((e) => e.amount)
                                                                              .toList()),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        ),
                                                                        '1,000,000.00',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.plusJakartaSans(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF199897),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 2.0)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ].addToStart(
                                                SizedBox(height: 10.0)),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
