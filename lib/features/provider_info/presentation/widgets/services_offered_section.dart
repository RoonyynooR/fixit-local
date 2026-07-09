import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localservice/core/functions/navigations.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';


const List<String> kAvailableServices = [
  'Wiring Repair',
  'Panel Upgrades',
  'Lighting Installation',
  'EV Charging Ports',
  'Outlet Installation',
  'Circuit Breaker',
  'Generator Setup',
  'Smart Home Wiring',
  'Ceiling Fan Install',
  'Home Inspection',
  'Plumbing Repair',
  'Pipe Installation',
  'Drain Cleaning',
  'Water Heater',
  'HVAC Service',
  'AC Installation',
  'Painting',
  'Carpentry',
  'Tiling',
  'Landscaping',
];

class ServicesOfferedSection extends StatefulWidget {
  final List<String> selectedServices;
  final ValueChanged<List<String>> onChanged;

  const ServicesOfferedSection({
    super.key,
    required this.selectedServices,
    required this.onChanged,
  });

  @override
  State<ServicesOfferedSection> createState() => _ServicesOfferedSectionState();
}

class _ServicesOfferedSectionState extends State<ServicesOfferedSection> {
  late List<String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List.from(widget.selectedServices);
  }

  void _removeService(String service) {
    setState(() => _selected.remove(service));
    (_selected);
  }

  void _showAddServiceSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AddServiceSheet(
        available: kAvailableServices
            .where((s) => !_selected.contains(s))
            .toList(),
        onAdd: (service) {
          setState(() {
            if (!_selected.contains(service)) _selected.add(service);
          });
          
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Services Offered', style: TextStyles.title1),
        const Gap(16),
    
        Wrap(
          spacing: 8,
          runSpacing: 10,
          children: _selected
              .map((service) => _ServiceChip(
                    label: service,
                    onRemove: () => _removeService(service),
                  ))
              .toList(),
        ),
    
        const Gap(12),
    
        GestureDetector(
          onTap: _showAddServiceSheet,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.lightgrey1),
              color: AppColors.backgroundColor1,
            ),
            child: Text(
              'Add Specialty',
              style: TextStyles.body2.copyWith(
                color: AppColors.darkgreycolor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class _ServiceChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _ServiceChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.containercolor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.titlecolor.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyles.caption1.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              size: 15,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}


class _AddServiceSheet extends StatefulWidget {
  final List<String> available;
  final ValueChanged<String> onAdd;

  const _AddServiceSheet({required this.available, required this.onAdd});

  @override
  State<_AddServiceSheet> createState() => _AddServiceSheetState();
}

class _AddServiceSheetState extends State<_AddServiceSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.lightgrey1,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text('Add a Service', style: TextStyles.title1),
            const Gap(16),

            
            Expanded(
              child: widget.available.isEmpty
                  ? Center(
                      child: Text(
                        'All services already added!',
                        style: TextStyles.caption2,
                      ),
                    )
                  : ListView.separated(
                      controller: scrollController,
                      itemCount: widget.available.length,
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemBuilder: (context, i) => ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4),
                        title: Text(widget.available[i], style: TextStyles.body2),
                        trailing: const Icon(Icons.add,
                            color: AppColors.titlecolor, size: 20),
                        onTap: () {
                          widget.onAdd(widget.available[i]);
                          pop(context);
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
