import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirdak/core/common/cubits/favorites_cubit.dart';
import 'package:wirdak/core/common/cubits/ziker_cubit.dart';
import 'package:wirdak/core/common/models/azkar_model.dart';
import 'package:wirdak/core/common/widgets/ziker_thwab.dart';
import 'package:wirdak/core/utils/spacing.dart';

class ZikerActions extends StatefulWidget {
  final ZikerModel ziker;
  bool isFavorite;
  ZikerActions({
    super.key,
    required this.ziker,
    required this.isFavorite,
  });

  @override
  State<ZikerActions> createState() => _ZikerActionsState();
}

class _ZikerActionsState extends State<ZikerActions> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ZikerCubit(widget.ziker.count),
      child: BlocBuilder<ZikerCubit, ZikerState>(
        builder: (context, state) {
          return Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                verticalSpace(22),
                const ZikerThwab(),
                verticalSpace(18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        final cubit = context.read<FavoritesCubit>();
                        if (widget.isFavorite) {
                          cubit.removeFromFavorites(widget.ziker);
                        } else {
                          cubit.addToFavorites(widget.ziker);
                        }
                        context.read<ZikerCubit>().toggleFavorite();
                        setState(() {
                          widget.isFavorite = !widget.isFavorite;
                        });
                      },
                      iconSize: 24,
                      icon: Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: const Color(0xFF005773),
                      ),
                    ),
                    horizontalSpace(8),
                    GestureDetector(
                      onTap: () {
                        context.read<ZikerCubit>().increment();
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color(0xFF01B7F1), width: 1.5),
                        ),
                        child: Center(
                          child: state.count > 0
                              ? Text(
                                  state.count.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFF01B7F1),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                )
                              : const Icon(
                                  Icons.done,
                                  color: Color(0xFF01B7F1),
                                ),
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    IconButton(
                      onPressed: () {
                        // Add share functionality if needed
                      },
                      iconSize: 24,
                      icon: const Icon(
                        Icons.share,
                        color: Color(0xFF005773),
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),
              ],
            ),
          );
        },
      ),
    );
  }
}
